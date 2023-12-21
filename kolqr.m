clc;
A = [-0.0025 0 0; 0.0694 -0.1 0; -0.0067 0 0];
B = [0.9 -0.349 -0.15; 0 14.16 0 ; 0 -1.398 1.659];
C = [ 1 0 0 ; 0 1 0 ; 0.0063 0 0.0047];
D = [ 0 0 0 ; 0 0 0 ; 0.2533 0.5124 -0.014];
Q = [0.01 0 0 ; 0 0.01 0 ; 0 0 0.01];
R = [100 0 0 ; 0 100 0 ; 0 0 100];
Qa = [10.8 0 0 ; 0 6.66 0 ; 0 0 0.01];
Qa1 = [5.4 0 0 ; 0 3.33 0 ; 0 0 0.005];
Ra = [0.034 0 0 ; 0 0.069 0 ; 0 0 0.0433];
Ra1 = [0.017 0 0 ; 0 0.034 0 ; 0 0 0.0216];
G = [1 0 0; 0 1 0; 0 0 1];
ob = obsv(A,C);
unob = length(A)-rank(ob); %mengecek observabilitas
co = ctrb(A,B);
unco = length(A)-rank(co); %mengecek controlabilitas
[S,a,K] = care(A,B,Q,R);
[X,m,L] = care(A',C',G*Qa*G',Ra);
[X1,m1,L1] = care(A',C',G*Qa1*G',Ra1);
eig(A-B*K) %mengecek stabilitas plant
eig(A'-C'*L) %mengecek stabilitas filter Kalman
eig(A'-C'*L1) %mengecek stabilitas filter Kalman


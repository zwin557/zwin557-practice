% This code is for MATLAB-OPTIMISATION tool. 
% This file merges flow, pressure and volume into one file
% so that it can be optimised in "MATLAB".

% ======================= CHANGE NAME.
patient = 'G4P';

f = '_flow_5.txt';
p = '_pressure_5.txt';
ff = [patient f];
pp = [patient p];
flow = load(ff);
pressure = load(pp);

Q = flow./1000; % ml/s ==> L/s
P = pressure; % cmH2O
volume = Q./100; % Volume = Flow * timestep

V(1)=volume(1);
for i=1:size(volume)-1;
    V(i+1)=V(i)+volume(i+1);
end

V = V';
a = [Q,P,V];

txt = '.txt';
txtfile = [patient txt];

fid=fopen(txtfile,'wt');
    for j=1:size(Q)
        fprintf(fid,'%f            %f           %f\n', a(j,:));
    end
fclose(fid);
clear
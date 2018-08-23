#!/bin/sh

: ${HOST:=127.0.0.1}
: ${PORT:=1700}
: ${F_PLAN:=cn433}

while getopts h:p:f: option 
do 
 case "${option}" 
 in 
 h) HOST=${OPTARG};; 
 p) PORT=${OPTARG};;
 f) F_PLAN=${OPTARG};; 
 esac 
done 

echo "host:"$HOST 
echo "port:"$PORT
echo "f_plan:"$F_PLAN



sed -i 's/\(^\s*"server_address":\s*"\).*"\s*\(,\?\).*$/\1'${HOST}'"\2/' ./local_conf.json
sed -i 's/\(^\s*"serv_port_up":\s*\).*\s*\(,\?\).*$/\1'${PORT}'\2/' ./local_conf.json
sed -i 's/\(^\s*"serv_port_down":\s*\).*\s*\(,\?\).*$/\1'${PORT}'"\2/' ./local_conf.json

ln -sf global_conf_${F_PLAN}.json global_conf.json


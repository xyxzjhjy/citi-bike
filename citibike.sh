#!/bin/bash
mkdir ../citibike_all
cd  ../citibike_allc
for i in $(seq 9) ; do
  wget https://witestlab.poly.edu/bikes/20160"$i"-citibike-tripdata.zip
done
for i in $(seq 9) ; do
  unzip 20160"$i"-citibike-tripdata.zip
  awk -F "\"*,\"*" '{print $5}' 20160"$i"-citibike-tripdata.csv >> station.txt
done
#awk -F "\"*,\"*" '{print $5}' 201601-citibike-tripdata.csv >> station.txt
#cat station.txt | sort>sort.txt
#cat station.txt | sort -u>uniq.txt
#wc -l uniq.txt
#sort sort.txt | uniq -dc > num.txt
#sort -n  num.txt>ans.txt
#tail --lines=1 ans.txt
#wc -l ans.txt
cat station.txt | sort | uniq -dc | sort -n | tail --lines=1 >>answer.txt
cat answer.txt

downgrader: main.o
	g++ main.o cJSON.c -lalpm -lcurl -o downgrader

main.o: main.c Interface.h Actions.h variables.h
	gcc -g -c main.c -o main.o -std=c99 -Wno-implicit-function-declaration

install: downgrader
	strip -s downgrader
	cp downgrader /usr/sbin/downgrader
 

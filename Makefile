mx5500: mx5500.c Makefile
	gcc -Wall -O mx5500.c -o mx5500

clean:
	rm -f mx5500.o
	
clean-all:
	rm -f mx5500.o mx5500

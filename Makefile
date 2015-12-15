.PHONY: clean, mrproper
CC = gcc
CFLAGS = -Wall -Wextra -O2
PREFIX = /usr/bin

usleep: usleep.c
	$(CC) $(CFLAGS) -o $@ $+

install:
	install -D -m755 usleep $(PREFIX)/usleep

clean:
	rm -f usleep

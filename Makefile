CC=gcc
CFLAGS=-Wall -Wextra `pkg-config --cflags gtk+-3.0`
LDFLAGS=`pkg-config --libs gtk+-3.0` -lm

build:
	$(CC) -Isrc/include  $(CFLAGS) src/*.c src/ss/*.c -o zenmonitor $(CFLAGS) $(LDFLAGS)

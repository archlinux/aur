CC=gcc
CFLAGS=-Wall -I. -std=c99
BIN=/usr/local/bin
.PHONY: install purge clean

lst: lst.c
	@$(CC) $^ -o $@ $(CFLAGS)

install:
	@sudo cp lst $(BIN)

purge: clean
	@sudo rm $(BIN)/lst

clean:
	@rm lst

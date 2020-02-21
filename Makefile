CC = gcc

SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)

EXEC = updiprog

$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

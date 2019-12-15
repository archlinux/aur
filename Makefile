.PHONY: all help clean

all: help

help:
	@echo "help  - print this help message"
	@echo "clean - clean this repository"

clean:
	rm -rfv ./src ./pkg ./*.pkg.tar.xz

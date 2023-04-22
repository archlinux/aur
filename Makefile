.PHONY: all

all: clean build srcinfo

build:
	makepkg -s

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src cal8tor/ cal8tor*.tar.*

git-hook:
	cp pre-commit .git/hooks

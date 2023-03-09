.PHONY: install check

install:
	makepkg -i

check:
	pacman -Q virtualhere-client


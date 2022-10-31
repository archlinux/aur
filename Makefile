.PHONY: srcinfo
srcinfo:
	makepkg --printsrcinfo > .SRCINFO

all:
	makepkg -si

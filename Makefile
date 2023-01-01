.PHONY: all
all:
	makepkg -g
	makepkg -fc
	makepkg --printsrcinfo > .SRCINFO

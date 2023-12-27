build:
	makepkg -SCc

install:
	makepkg --install

info:
	makepkg --printsrcinfo > .SRCINFO

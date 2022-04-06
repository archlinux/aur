srcinfo:
	makepkg --printsrcinfo > .SRCINFO

install:
	makepkg -si

build:
	makepkg -f

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

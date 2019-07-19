clean:
	git clean -xdf

build:
	makepkg --printsrcinfo > .SRCINFO
	makepkg -s
package:
	makepkg
	makepkg --printsrcinfo > .SRCINFO

install:
	pacman -U *.tar.xz

clean:
	git clean -fdX



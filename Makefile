package:
	makepkg -f
	makepkg --printsrcinfo > .SRCINFO

install:
	pacman -U *.tar.xz

clean:
	git clean -fdX



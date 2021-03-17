package:
	makepkg -f
	makepkg --printsrcinfo > .SRCINFO

install:
	pacman -U *.tar.zst

clean:
	git clean -fdX



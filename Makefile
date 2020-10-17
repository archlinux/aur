package:
	makepkg -f

install:
	sudo pacman --noconfirm -U pyvidctrl-*.pkg.tar.*

clean:
	rm -rf pkg src
	rm -rf pyvidctrl*

update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

generate-checksums:
	makepkg -g -f -p PKGBUILD

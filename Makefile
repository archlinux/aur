package:
	makepkg -f

install:
	sudo pacman --noconfirm -U python-v4l2_antmicro-*.pkg.tar.*

clean:
	rm -rf pkg src
	rm -rf python-v4l2*

update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

generate-checksums:
	makepkg -g -f -p PKGBUILD

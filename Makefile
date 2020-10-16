package:
	makepkg -f

install:
	sudo pacman --noconfirm -U git-subrepo-*.pkg.tar.*

clean:
	rm -rf pkg src
	rm -rf git-subrepo*

update-srcinfo:
	makepkg --printsrcinfo > .SRCINFO

generate-checksums:
	makepkg -g -f -p PKGBUILD

update::
	./generate-pkgbuild.sh stable > PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

install::
	makepkg -si

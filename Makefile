update::
	./generate-pkgbuild.sh > PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

install::
	makepkg -si

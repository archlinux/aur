update::
	./generate_pkgbuild.sh > PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

install::
	makepkg -si

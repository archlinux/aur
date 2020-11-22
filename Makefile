update::
	./generate-pkgbuild.sh rapid > PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

install::
	makepkg -si

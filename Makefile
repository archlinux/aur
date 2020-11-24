update::
	./generate-pkgbuild.sh stable > PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

install::
	makepkg -si

clean::
	git clean -fdx

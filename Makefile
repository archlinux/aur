update::
	./generate-pkgbuild.sh > PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

install::
	makepkg -si

clean::
	git clean -fdx

update::
	./generate-pkgbuild.sh > PKGBUILD
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

install::
	makepkg -si

clean::
	git clean -fdx

update::
	./generate-pkgbuild.sh regular > PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

install::
	makepkg -si

clean::
	git clean -fdx

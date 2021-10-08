update::
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

install::
	makepkg -si

clean::
	git clean -fdx

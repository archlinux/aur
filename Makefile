all:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
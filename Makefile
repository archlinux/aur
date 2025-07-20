
update:
	updpkgsums
	makepkg -i
	makepkg --printsrcinfo > .SRCINFO


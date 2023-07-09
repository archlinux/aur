checksums:
	makepkg --geninteg

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

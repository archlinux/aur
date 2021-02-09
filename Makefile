srcinfo:
	makepkg --printsrcinfo > .SRCINFO

integrity:
	rm -rf metalctl-*
	makepkg -g

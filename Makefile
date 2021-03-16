srcinfo:
	makepkg --printsrcinfo > .SRCINFO

integrity:
	rm -rf crane-*
	makepkg -g

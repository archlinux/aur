srcinfo:
	makepkg --printsrcinfo > .SRCINFO

integrity:
	rm -rf metalctl-linux-amd64
	makepkg -g

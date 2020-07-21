srcinfo:
	makepkg --printsrcinfo > .SRCINFO

integrity:
	rm -rf cloudctl-linux-amd64
	makepkg -g

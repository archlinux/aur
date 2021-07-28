srcinfo:
	makepkg --printsrcinfo > .SRCINFO

integrity:
	rm -rf cloudctl-linux-*
	makepkg -g

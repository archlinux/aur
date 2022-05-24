clean:
	rm -rf pkg/ src/ mx-puppet-slack/ mx-puppet-slack-git-*.tar

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

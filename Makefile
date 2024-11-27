generate:
	makepkg --printsrcinfo > .SRCINFO
	git add .
	git commit -m "new version"
	git push

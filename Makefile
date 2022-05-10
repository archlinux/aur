
release:
	makepkg --printsrcinfo > .SRCINFO
	git add .
	git commit . -m update
	git push



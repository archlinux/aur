clean:
	rm -rf eggplant-git
	rm -rf eggplant-git-r*
	rm -rf pkg
	rm -rf src

update: clean
	makepkg
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean update

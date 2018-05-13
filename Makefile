
.PHONY: srcinfo

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

build: srcinfo
	makepkg -cCsi

release: srcinfo
	git commit -a
	git push


clean:
	sudo rm -rf pkg/ src/ fe/ *.zst *.tar.xz

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

install:
	make clean
	make srcinfo
	makepkg -si
	make clean

release:
	make clean
	makepkg -g
	make srcinfo
	git add -A
	git commit --allow-empty -am "new release"
	git push
	make clean

clean:
	sudo rm -rf pkg/ src/ fe/ *.zst fe-*.tar.gz

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

install:
	make clean
	make srcinfo
	makepkg -si
	make clean

release:
	make clean
	updpkgsums
	make srcinfo
	git add -A
	git commit --allow-empty -am "new release"
	git push
	make clean

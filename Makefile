clean:
	sudo rm -rf pkg/ src/ fe/ *.zst

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

si:
	makepkg -si

in:
	make clean
	make srcinfo
	make si
	make clean

prep:
	make clean
	make srcinfo
	make clean

rel:
	make prep
	git add -A
	git commit -am "new release"
	git push

pkg:
	makepkg -s

clean:
	rm -rf pkg/ src/ node/ webmesh/ *.tar.zst

prepare:
	makepkg --printsrcinfo > .SRCINFO

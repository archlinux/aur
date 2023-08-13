pkg:
	makepkg -s

clean:
	rm -rf pkg/ src/ node/ webmesh/

prepare:
	makepkg --printsrcinfo > .SRCINFO

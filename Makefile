help:
	cat README.md
SRCINFO:
	makepkg --printsrcinfo > .SRCINFO
clean:
	rm -rf sunshine*.pkg.tar.zst pkg src
sync:
	makepkg -s
install:
	makepkg -i
force-sync: clean sync
sha256:
	sha256sum sunshine.pkg.tar.zst

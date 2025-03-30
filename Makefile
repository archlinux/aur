clean:
	@rm -rf pkg/ *.pkg.tar.zst

test:
	$(MAKE) clean
	@makepkg -si


publish:
	@makepkg --printsrcinfo > .SRCINFO
	@git add .
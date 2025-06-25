update:
	@updpkgsums
	@makepkg --printsrcinfo > .SRCINFO

clean:
	@rm -rf src/ pkg/ *.pkg.tar.zst *.tar.gz .history/ LICENSE-*

test:
	@rm -rf *.pkg.tar.zst
	@makepkg -s

publish:
	@git add .
	@source ./PKGBUILD; \
	echo "Update to $$pkgver"; \
	git commit -m "Update to $$pkgver"
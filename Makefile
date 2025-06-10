update:
	@updpkgsums
	@MAJORVER=$$(sed -n 's/^_majorver=//p' PKGBUILD); \
	if [ -d "/tmp/idea-$$MAJORVER" ]; then rm -r "/tmp/idea-$$MAJORVER"; fi; \
	mkdir -p "/tmp/idea-$$MAJORVER"; \
	tar xf "ideaIC-$$MAJORVER.tar.gz" -C "/tmp/idea-$$MAJORVER"; \
	buildver=$$(ls -a "/tmp/idea-$$MAJORVER" | grep idea-IC | awk -F 'idea-IC-' '{ print $$2 }'); \
	sed -i "s/^_buildver=.*/_buildver=$$buildver/" PKGBUILD; \
	echo "Updated buildver to $$buildver"
	@updpkgsums
	@makepkg --printsrcinfo > .SRCINFO
	@source ./PKGBUILD; \
	echo "Update to $$pkgver"

clean:
	@rm -rf src/ pkg/ *.pkg.tar.zst

test:
	@rm -rf *.pkg.tar.zst
	@makepkg -s

publish:
	@git add .
	@source ./PKGBUILD; \
	echo "Update to $$pkgver"; \
	git commit -m "Update to $$pkgver"
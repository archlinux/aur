.DEFAULT_GOAL := build

build: 
	@makepkg -sfi
	@makepkg --printsrcinfo > .SRCINFO

clean:
	@rm -rf src/
	@rm -rf pkg/
	@rm -f coolercontrol-*.pkg.tar.zst
	@rm -f coolercontrol-*.tar.gz

test:
	@echo "In the TEST-PKGBUILD file:"
	@echo "  - change the branch variable to the branch name"
	@makepkg -sfi -p TEST-PKGBUILD --skipchecksums

checksum:
	@sha256sum ./coolercontrol-*.tar.gz


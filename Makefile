version = 9add3366d25530d51d168608c54b5339b64d2a4e

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

build:clear ## Builds pakage
	makepkg -s

clear: ## Clears files
	rm -rf ./pkg
	rm -rf ./src
	rm -f ./*.deb
	rm -f ./*.zip
	rm -f ./shadow-*.pkg.tar
	rm -f ./shadow-*.pkg.tar.xz
	rm -f ./*~
	rm -f *.AppImage
	rm -f *.yml

install:build ## Installs package with pacman
	sudo pacman -U shadow-*.pkg.tar

pkgsum: ## Updates pkgsum with updpkgsums
	updpkgsums

release:clear pkgsum srcinfo ## Release preparation
	git pull

sanity: ## Checkcwqing package sanity
	namcap shadow-*.pkg.tar

srcinfo: ## Generates .SRCINFO
	makepkg --printsrcinfo > .SRCINFO

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
	rm -f ./shadow-beta-*.pkg.tar
	rm -f ./shadow-beta-*.pkg.tar.xz
	rm -f ./*~
	rm -f shadow-beta.zip
	rm -f *.AppImage
	rm -f *.yml

install:build ## Installs package with pacman
	sudo pacman -U shadow-beta-*.pkg.tar

pkgsum: ## Updates pkgsum with updpkgsums
	updpkgsums

recup: ## Get git files
	wget -O INSTALL https://raw.githubusercontent.com/NicolasGuilloux/blade-shadow-beta/master/Arch/AUR/INSTALL
	wget -O wrapper.pl https://raw.githubusercontent.com/NicolasGuilloux/blade-shadow-beta/master/AppImage/wrapper.pl
	wget -O report.pl https://raw.githubusercontent.com/NicolasGuilloux/blade-shadow-beta/master/AppImage/report.pl

release:clear pkgsum srcinfo ## Release preparation
	git pull

sanity: ## Checking package sanity
	namcap shadow-beta-*.pkg.tar

srcinfo: ## Generates .SRCINFO
	makepkg --printsrcinfo > .SRCINFO

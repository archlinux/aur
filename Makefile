version = 3ab413613a6c3c4b78d3f3eb030068c0ea497a4e

help:
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

build:clear ## Builds pakage
	makepkg -s

clear: ## Clears files
	rm -rf ./pkg
	rm -rf ./src
	rm -f ./*.deb
	rm -f ./*.zip
	rm -f ./shadow-alpha-*.pkg.tar
	rm -f ./shadow-alpha-*.pkg.tar.xz
	rm -f ./shadow-alpha-*.pkg.tar.zst
	rm -f ./*~
	rm -f shadow-alpha.zip
	rm -f *.AppImage
	rm -f *.yml

install:build ## Installs package with pacman
	sudo pacman -U shadow-alpha-*.pkg.tar

pkgsum: ## Updates pkgsum with updpkgsums
	updpkgsums

recup: ## Get git files
	wget -O INSTALLhttps://raw.githubusercontent.com/noah-witt/shadow-alpha/master/Arch/AUR/INSTALL
	wget -O wrapper.pl https://raw.githubusercontent.com/noah-witt/shadow-alpha/master/AppImage/wrapper.pl
	wget -O report.pl https://raw.githubusercontent.com/noah-witt/shadow-alpha/master/AppImage/report.pl

release:clear pkgsum srcinfo ## Release preparation
	git pull

sanity: ## Checking package sanity
	namcap shadow-alpha-*.pkg.tar

srcinfo: ## Generates .SRCINFO
	makepkg --printsrcinfo > .SRCINFO

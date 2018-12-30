version = 76fea495eda10a2a7edef93609d176ac141c648e

help: 
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

build:clear recup ## Build pakage
	makepkg -s

clear: ## Clear files
	rm -rf ./pkg
	rm -rf ./src
	rm -f ./*.deb
	rm -f ./*.pl
	rm -f ./shadow-beta-*.pkg.tar
	rm -f ./*~

install:build ## Install package with pacman
	sudo pacman -U shadow-beta-*.pkg.tar

pkgsum: ## update pkgsum with updpkgsums
	updpkgsums

recup: ## Get git files
	wget -O shadow-beta.install https://raw.githubusercontent.com/NicolasGuilloux/blade-shadow-beta/${version}/Arch/AUR/INSTALL
	wget -O wrapper.pl https://raw.githubusercontent.com/NicolasGuilloux/blade-shadow-beta/${version}/AppImage/wrapper.pl
	wget -O report.pl https://raw.githubusercontent.com/NicolasGuilloux/blade-shadow-beta/${version}/AppImage/report.pl

srcinfo: ## génération .SRCINFO
	makepkg --printsrcinfo > .SRCINFO

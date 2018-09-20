version = 29b05995687a1e3fe57f1666b6b7b9ca3bf6f52f
version = 1187dcd31cb4d608d74324d522c71fac61c319fc

help: 
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-10s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

build:clear recup ## Build pakage
	makepkg -s

clear: ## Clear files
	rm -rf ./pkg
	rm -rf ./src
	rm -f ./shadowbeta.deb
	rm -f ./shadow-beta-*.pkg.tar
	rm -f ./*~

install:build ## Install package with pacman
	sudo pacman -U shadow-beta-*.pkg.tar

pkgsum: ## update pkgsum with updpkgsums
	updpkgsums

recup: ## Get git files
	wget -O INSTALL https://raw.githubusercontent.com/NicolasGuilloux/blade-shadow-beta/${version}/Arch/AUR/INSTALL
	wget -O wrapper.pl https://raw.githubusercontent.com/NicolasGuilloux/blade-shadow-beta/${version}/AppImage/wrapper.pl
	wget -O report.pl https://raw.githubusercontent.com/NicolasGuilloux/blade-shadow-beta/${version}/AppImage/report.pl

srcinfo: ## génération .SRCINFO
	makepkg --printsrcinfo > .SRCINFO

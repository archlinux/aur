srcinfo:
	makepkg --printsrcinfo > .SRCINFO

integrity:
	rm -rf crane-*
	makepkg -g

generate:
	@sed -i -r "s/pkgver=.*/pkgver=$$VER/g" PKGBUILD
	@sed -i -r "s/sha256sums=.*/sha256sums=(\\'$$SHA256\\')/g" PKGBUILD

.ONESHELL:
specificrelease:
	@export VER=0.7.0
	@export MD5=14092fd3c5d6566f8bd53875dc7cbdc187d9e93f28dab1c677d1ee5959cb703c
	@make generate srcinfo

.ONESHELL:
latestrelease:
	@export VER=$(shell curl -sL https://api.github.com/repos/google/go-containerregistry/releases/latest | jq -r ".name" | cut -c 2-)
	@export SHA256=$(shell curl -sL https://api.github.com/repos/google/go-containerregistry/releases/latest | jq -r ".assets[] | select(.name | contains(\"checksums.txt\")) | .browser_download_url" | wget -q -i - -O - | grep Linux_x86_64 | cut -d' ' -f1)
	@make generate srcinfo

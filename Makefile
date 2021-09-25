srcinfo:
	makepkg --printsrcinfo > .SRCINFO

integrity:
	rm -rf cloudctl-linux-*
	makepkg -g

generate:
	@sed -i -r "s/pkgver=.*/pkgver=$$VER/g" PKGBUILD
	@sed -i -r "s/md5sums=.*/md5sums=(\\'$$MD5\\')/g" PKGBUILD

.ONESHELL:
specificrelease:
	@export VER=0.10.0
	@export MD5=d6031c383b8a69a5f92fc6510f9cec49
	@make generate srcinfo

.ONESHELL:
latestrelease:
	@export VER=$(shell curl -sL https://api.github.com/repos/fi-ts/cloudctl/releases/latest | jq -r ".name" | cut -c 2-)
	@export MD5=$(shell curl -sL https://api.github.com/repos/fi-ts/cloudctl/releases/latest | jq -r ".assets[] | select(.name | contains(\"linux-amd64.md5\")) | .browser_download_url" | wget -q -i - -O - | cut -d' ' -f1)
	@make generate srcinfo
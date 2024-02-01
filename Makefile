

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

integrity:
	rm -rf metalctl-*
	makepkg -g

generate:
	@sed -i -r "s/pkgver=.*/pkgver=$$VER/g" PKGBUILD
	@sed -i -r "s/md5sums=.*/md5sums=(\\'$$MD5\\')/g" PKGBUILD

.ONESHELL:
latestrelease:
	@export VER=$(shell curl -sL https://api.github.com/repos/metal-stack-cloud/cli/releases/latest | jq -r ".name" | cut -c 2-)
	@export MD5=$(shell curl -sL https://api.github.com/repos/metal-stack-cloud/cli/releases/latest | jq -r ".assets[] | select(.name | contains(\"linux-amd64.md5\")) | .browser_download_url" | wget -q -i - -O - | cut -d' ' -f1)
	@make generate srcinfo

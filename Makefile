

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

integrity:
	rm -rf metalctl-*
	makepkg -g

generate:
	@sed -i -r "s/pkgver=.*/pkgver=$$VER/g" PKGBUILD
	@sed -i -r "s/sha512sums_x86_64=.*/sha512sums_x86_64=(\\'$$SHA512\\')/g" PKGBUILD

.ONESHELL:
specificrelease:
	@export VER=0.11.0
	@export SHA512=6db012adc46350e49ebcc0d559cd0a4e
	@make generate srcinfo

.ONESHELL:
latestrelease:
	@export VER=$(shell curl -sL https://api.github.com/repos/metal-stack/metalctl/releases/latest | jq -r ".name" | cut -c 2-)
	@export SHA512=$(shell curl -sL https://api.github.com/repos/metal-stack/metalctl/releases/latest | jq -r ".assets[] | select(.name | contains(\"linux-amd64.sha512\")) | .browser_download_url" | wget -q -i - -O - | cut -d' ' -f1)
	echo $(VER) $(SHA512)
	@make generate srcinfo

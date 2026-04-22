srcinfo:
	makepkg --printsrcinfo > .SRCINFO

integrity:
	rm -rf cloudctl-linux-*
	makepkg -g

generate:
	@sed -i -r "s/pkgver=.*/pkgver=$$VER/g" PKGBUILD
	@sed -i -r "s/sha512sums_x86_64=.*/sha512sums_x86_64=(\\'$$SHA512\\')/g" PKGBUILD

.ONESHELL:
specificrelease:
	@export VER=0.14.16
	@export SHA512=298dba2df1de84fc9fbf350a8235ae40fca59bf53bab1a50f9def405a55ed043f5fa8fce1378238e20fad2e1d20155e6547dd1a2cff3ef4ed353491091f4da56
	@make generate srcinfo

.ONESHELL:
latestrelease:
	@export VER=$(shell curl -sL https://api.github.com/repos/fi-ts/cloudctl/releases/latest | jq -r ".name" | cut -c 2-)
	@export SHA512=$(shell curl -sL https://api.github.com/repos/fi-ts/cloudctl/releases/latest | jq -r ".assets[] | select(.name | contains(\"linux-amd64.sha512\")) | .browser_download_url" | wget -q -i - -O - | cut -d' ' -f1)
	@make generate srcinfo
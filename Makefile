srcinfo:
	makepkg --printsrcinfo > .SRCINFO
	rm -rf fq-*.tar.gz

integrity:
	rm -rf fq-*.tar.gz
	makepkg -g

generate:
	@sed -i -r "s/pkgver=.*/pkgver=$$VER/g" PKGBUILD
	@sed -i -r "s/sha256sums=.*/sha256sums=(\\'$$SHA256\\')/g" PKGBUILD

.ONESHELL:
specificrelease:
	@export VER=0.0.2
	@export SHA256=a0b93ce71d03eb98b5f8106a1596540606ce1295c0cb1db6e459276e5df51269
	@make generate srcinfo

.ONESHELL:
latestrelease:
	@export VER=$(shell curl -sL https://api.github.com/repos/wader/fq/releases/latest | jq -r ".name" | cut -c 2-)
	@export SHA256=$(shell curl -sL https://api.github.com/repos/wader/fq/releases/latest | jq -r ".assets[] | select(.name | contains(\"checksums.txt\")) | .browser_download_url" | wget -q -i - -O - | grep linux_amd64.tar.gz | cut -d' ' -f1)
	@make generate srcinfo

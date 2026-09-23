# Maintainer: su226 <thesu226@outlook.com>

pkgname=r2modman
pkgver=3.2.20
pkgrel=1
epoch=
pkgdesc="A simple and easy to use mod manager for several games using Thunderstore."
arch=(any)
url="https://github.com/ebkr/r2modmanPlus"
license=("MIT")
groups=()
_electron=electron38
depends=("$_electron")
makedepends=(pnpm node-gyp python)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
# https://github.com/ebkr/r2modmanPlus/archive/refs/tags/v3.2.20.tar.gz shows version 3.2.19, weird.
_commit=4be4fec0b0cff2fe5d302c879a04e4d5c7c1415a
source=("r2modmanPlus-$_commit.tar.gz::https://github.com/ebkr/r2modmanPlus/archive/$_commit.tar.gz"
        "r2modman.desktop")
noextract=()
sha256sums=('e46282ec7bb8e74b1e054115fb566235a68586b52cf860892869cbf8d4f340f8'
            '6cd96385f1ad7bf6fec0f9a70b429305e6f20153528e415d3c943ff19a45fd0f')
validpgpkeys=()

prepare() {
	cd "r2modmanPlus-$_commit"
	# Modify electron-builder config
	local _electronDist="/usr/lib/$_electron"
	local _electronVersion="$(<$_electronDist/version)"
	sed -e "s/'AppImage', 'tar.gz', 'deb', 'rpm', 'pacman'/'dir'/" -e "/builder: {/a electronDist: \"$_electronDist\", electronVersion: \"$_electronVersion\"," -i quasar.config.ts
	pnpm install
}

build() {
	cd "r2modmanPlus-$_commit"
	pnpm build-linux
}

check() {
	cd "r2modmanPlus-$_commit"
	node test/folder-structure-testing/populator.mjs
	pnpm test
}

package() {
	cd "r2modmanPlus-$_commit"
	install -Dm644 dist/electron/Packaged/linux-unpacked/resources/app.asar "$pkgdir/usr/share/r2modman/app.asar"

	install -d "$pkgdir/usr/bin"
	printf '#!/bin/bash\nexec %s /usr/share/r2modman/app.asar "$@"\n' "$_electron" > "$pkgdir/usr/bin/r2modman"
	chmod 755 "$pkgdir/usr/bin/r2modman"

	install -Dm644 "$srcdir/r2modman.desktop" "$pkgdir/usr/share/applications/r2modman.desktop"
	for _icon in src/assets/icon/*; do
		install -Dm644 "$_icon" "$pkgdir/usr/share/icons/hicolor/$(basename -s .png $_icon)/apps/r2modman.png"
	done

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/r2modman/LICENSE"
}

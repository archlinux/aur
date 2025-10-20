# Maintainer: su226 <thesu226@outlook.com>

pkgname=r2modman
pkgver=3.2.9
pkgrel=1
epoch=
pkgdesc="A simple and easy to use mod manager for several games using Thunderstore."
arch=(any)
url="https://github.com/ebkr/r2modmanPlus"
license=("MIT")
groups=()
_electron=electron38
depends=("$_electron")
makedepends=(yarn node-gyp python)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("r2modmanPlus-$pkgver.tar.gz::https://github.com/ebkr/r2modmanPlus/archive/refs/tags/v$pkgver.tar.gz"
        "r2modman.desktop")
noextract=()
sha256sums=('bfffd87dc8c7209d81c9041dc3c71b6a070b10480232dd8e7e89cb5b2101041d'
            '6cd96385f1ad7bf6fec0f9a70b429305e6f20153528e415d3c943ff19a45fd0f')
validpgpkeys=()

prepare() {
	cd "r2modmanPlus-$pkgver"
	# Modify electron-builder config
	local _electronDist="/usr/lib/$_electron"
	local _electronVersion="$(<$_electronDist/version)"
	sed -e "s/'AppImage', 'tar.gz', 'deb', 'rpm', 'pacman'/'dir'/" -e "/builder: {/a electronDist: \"$_electronDist\", electronVersion: \"$_electronVersion\"," -i quasar.config.ts
	yarn install
}

build() {
	cd "r2modmanPlus-$pkgver"
	yarn build-linux
}

check() {
	cd "r2modmanPlus-$pkgver"
	node test/folder-structure-testing/populator.mjs
	yarn test
}

package() {
	cd "r2modmanPlus-$pkgver"
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

# Maintainer: su226 <thesu226@outlook.com>

pkgname=r2modman
pkgver=3.1.56
pkgrel=1
epoch=
pkgdesc="A simple and easy to use mod manager for several games using Thunderstore."
arch=(any)
url="https://github.com/ebkr/r2modmanPlus"
license=("MIT")
groups=()
_electron=electron24
depends=("$_electron")
makedepends=(yarn)
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
sha256sums=(ecd9f25f0d160ca2cf514fd9fe3a2905cae705a5f5d21cfd7e25b256e22d5a62
            6cd96385f1ad7bf6fec0f9a70b429305e6f20153528e415d3c943ff19a45fd0f)
validpgpkeys=()

prepare() {
	cd "r2modmanPlus-$pkgver"
	# Modify electron-builder config
	local _electronDist="/usr/lib/$_electron"
	local _electronVersion="$(<$_electronDist/version)"
	sed -e "s/'AppImage', 'tar.gz', 'deb', 'rpm', 'pacman'/'dir'/" -e "/builder: {/a electronDist: \"$_electronDist\", electronVersion: \"$_electronVersion\"," -i quasar.conf.js
	yarn install
}

build() {
	cd "r2modmanPlus-$pkgver"
	yarn build-linux
}

check() {
	cd "r2modmanPlus-$pkgver"
	node test/folder-structure-testing/populator.mjs
	yarn test:unit
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

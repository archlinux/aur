# Maintainer: ArcticLampyrid <ArcticLampyrid@outlook.com>
# Contributor: Alex Henrie <alexhenrie24@gmail.com>
# Contributor: RubenKelevra <cyrond@gmail.com>

_archive_extension="tar.gz"
pkgname=ipfs-desktop-electron
_pkgname=ipfs-desktop
pkgver=0.38.0
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs/$_pkgname"
license=(MIT)
depends=(electron go-ipfs)
makedepends=("nodejs>=16" npm node-gyp)
provides=("$_pkgname")
source=("$_pkgname-$pkgver.$_archive_extension::https://github.com/ipfs/ipfs-desktop/archive/refs/tags/v$pkgver.$_archive_extension")
b2sums=('ded306db59a04d97b860cfa4e136e127254a84c7ddb493949f842a35bd5ecffa3f9d5777b67d13f84eceafe3d8b853625f855e052ecc1c79a104dc684cd688ca')

prepare() {
	cd "$_pkgname-$pkgver"
	npm ci --no-audit --progress=false --cache "$srcdir/npm-cache"
}

build() {
	cd "$_pkgname-$pkgver"
	npm run-script build
	npx electron-builder build --linux dir
}

package() {
	cd "$_pkgname-$pkgver"

	mkdir -p $pkgdir/usr/lib/ipfs-desktop
	mkdir -p $pkgdir/usr/bin

	cp -r dist/linux-unpacked/resources/* $pkgdir/usr/lib/ipfs-desktop/
	ln -sf /usr/bin/ipfs $pkgdir/usr/lib/ipfs-desktop/app.asar.unpacked/node_modules/kubo/kubo/ipfs

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	echo "#!/bin/sh
exec electron /usr/lib/ipfs-desktop/app.asar \"\$@\"" > ipfs-desktop
	install -Dm755 ipfs-desktop "$pkgdir/usr/bin/ipfs-desktop"
}

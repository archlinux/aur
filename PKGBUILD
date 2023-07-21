# Maintainer: @RubenKelevra
# Contributor: Alex Henrie <alexhenrie24@gmail.com>

_archive_extension="tar.gz"
pkgname=ipfs-desktop-electron
_pkgname=ipfs-desktop
pkgver=0.29.0
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs/$_pkgname"
license=(MIT)
depends=(electron go-ipfs)
makedepends=("nodejs>=16" npm node-gyp)
source=("$_pkgname-$pkgver.$_archive_extension::https://github.com/ipfs/ipfs-desktop/archive/refs/tags/v$pkgver.$_archive_extension")
b2sums=('effa07a4d2586d02553945ebf0cb19dcf12515f7b57a71c5080a75826331f85e69818bcf78d6d918d25ea5558b78de8be5d6ac26143acb4842bffc9958a70b1b')

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
	ln -sf /usr/bin/ipfs $pkgdir/usr/lib/ipfs-desktop/app.asar.unpacked/node_modules/go-ipfs/go-ipfs/ipfs
	
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	echo "#!/bin/sh
exec electron /usr/lib/ipfs-desktop/app.asar \"\$@\"" > ipfs-desktop	
	install -Dm755 ipfs-desktop "$pkgdir/usr/bin/ipfs-desktop"
}

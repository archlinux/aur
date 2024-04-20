# Maintainer: @RubenKelevra
# Contributor: Alex Henrie <alexhenrie24@gmail.com>

_archive_extension="tar.gz"
pkgname=ipfs-desktop-electron
_pkgname=ipfs-desktop
pkgver=0.34.0
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs/$_pkgname"
license=(MIT)
depends=(electron go-ipfs)
makedepends=("nodejs>=16" npm node-gyp)
source=("$_pkgname-$pkgver.$_archive_extension::https://github.com/ipfs/ipfs-desktop/archive/refs/tags/v$pkgver.$_archive_extension")
b2sums=('9589c0e33908b8f8def5dc2b2f205874464710f71ced63ffadb4e6fbf491f17266b023074df52abf1038643a5792e1e4e6f1cf0859b1c544209e233f9b395464')

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

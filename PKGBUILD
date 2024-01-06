# Maintainer: @RubenKelevra
# Contributor: Alex Henrie <alexhenrie24@gmail.com>

_archive_extension="tar.gz"
pkgname=ipfs-desktop-electron
_pkgname=ipfs-desktop
pkgver=0.32.0
pkgrel=1
pkgdesc="Desktop client for the InterPlanetary File System"
arch=(x86_64)
url="https://github.com/ipfs/$_pkgname"
license=(MIT)
depends=(electron go-ipfs)
makedepends=("nodejs>=16" npm node-gyp)
source=("$_pkgname-$pkgver.$_archive_extension::https://github.com/ipfs/ipfs-desktop/archive/refs/tags/v$pkgver.$_archive_extension")
b2sums=('9c8ee9ca03f88979ba46b18de8cfc54cc2fd6046f082bca44246f138fa7718c2970177888163a9977b8ee4488371fa9033012a2ebdc9fb2f4e3247c0496909d3')

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

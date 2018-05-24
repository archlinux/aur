# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=resvg
pkgver=0.3.0
pkgrel=1
pkgdesc='SVG rendering library and CLI'
arch=(i686 x86_64)
url="https://github.com/RazrFalcon/$pkgname"
license=(MPL2)
makedepends=(cargo qt5-base pango)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0e6c356cf440ea92908925f063afbee63cd0458f7261b0fa72b5297fcab19833')

build() {
	cd "$pkgname-$pkgver"
	for dir in capi tools/rendersvg; do
	(
		msg2 "Building $dir"
		cd "$dir"
		cargo build --release --features='qt-backend cairo-backend'
	)
	done
	
	msg2 'Building docs'
	cargo doc --release
}

package() {
	cd "$pkgname-$pkgver"
	
	install -Dm755 target/release/rendersvg   "$pkgdir/usr/bin/rendersvg"
	install -Dm755 target/release/libresvg.so "$pkgdir/usr/lib/libresvg.so"
	install -Dm644 capi/include/resvg.h       "$pkgdir/usr/include/resvg.h"
	install -d "$pkgdir/usr/share/doc/resvg"
	cp -r target/doc/* "$pkgdir/usr/share/doc/resvg"
}

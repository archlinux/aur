# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=resvg
pkgver=0.4.0
pkgrel=1
pkgdesc='SVG rendering library and CLI'
arch=(i686 x86_64)
url="https://github.com/RazrFalcon/$pkgname"
license=(MPL2)
makedepends=(cargo qt5-base pango)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ce079e6dc6d316bebe41bdedcb9e0714a1caf90c0d6f52d0b3aa1de37f989275')

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
	cargo doc --release --no-deps -p resvg-capi
}

package() {
	cd "$pkgname-$pkgver"
	
	install -Dm755 target/release/rendersvg   "$pkgdir/usr/bin/rendersvg"
	install -Dm755 target/release/libresvg.so "$pkgdir/usr/lib/libresvg.so"
	install -Dm644 capi/include/resvg.h       "$pkgdir/usr/include/resvg.h"
	install -d "$pkgdir/usr/share/doc/resvg"
	cp -r target/doc/* "$pkgdir/usr/share/doc/resvg"
}

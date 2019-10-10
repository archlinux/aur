# Mnaintainer: Kasei Wang <kasei@kasei.im>

pkgname=quiche
pkgver=0.1.0
pkgrel=1
pkgdesc='quiche is an implementation of the QUIC transport protocol and HTTP/3 as specified by the IETF'
arch=('x86_64')
url='https://github.com/cloudflare/quiche'
license=('custom:BSD')
depends=('gcc-libs')
makedepends=('rust' 'git')
source=("https://github.com/cloudflare/$pkgname/archive/$pkgver.tar.gz"
		"git+https://boringssl.googlesource.com/boringssl#branch=chromium-stable")
sha256sums=('6a369615005b8f1e361bfaca5ec07989443ab1b62af60a07ac41f63ff4b7d1af'
            'SKIP')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	rm -rf deps/boringssl
	ln -s $srcdir/boringssl deps/boringssl
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release --features pkg-config-meta
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/include
	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/usr/lib/pkgconfig

	install include/quiche.h $pkgdir/usr/include
	install target/release/libquiche.a $pkgdir/usr/lib
	install target/release/libquiche.so $pkgdir/usr/lib
	install target/release/quiche.pc $pkgdir/usr/lib/pkgconfig
}

# Maintainer: Kasei Wang <kasei@kasei.im>

pkgname=quiche
pkgver=0.6.0
pkgrel=1
pkgdesc='an implementation of the QUIC transport protocol and HTTP/3 as specified by the IETF'
arch=('x86_64')
url='https://github.com/cloudflare/quiche'
license=('custom:BSD')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'go' 'rust')
source=("https://github.com/cloudflare/$pkgname/archive/$pkgver.tar.gz"
		"git+https://boringssl.googlesource.com/boringssl#commit=597b810379e126ae05d32c1d94b1a9464385acd0")
sha256sums=('2cab5afdb7d30d5f3478c092d8a249dc3b8706a6796bfd26e52ef4ef59580158'
            'SKIP')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	rm -rf deps/boringssl
	ln -s $srcdir/boringssl deps/boringssl
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
    mkdir -p $pkgdir/usr/include
	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/usr/lib/pkgconfig
    mkdir -p $pkgdir/usr/share/licenses/quiche

	install -Dm644 include/quiche.h $pkgdir/usr/include
	install -Dm644 target/release/libquiche.a $pkgdir/usr/lib
	install -Dm755 target/release/libquiche.so $pkgdir/usr/lib
	install -Dm644 /dev/stdin $pkgdir/usr/lib/pkgconfig/quiche.pc <<PC
# quiche

Name: quiche
Description: quiche library
URL: https://github.com/cloudflare/quiche
Version: $pkgver
Libs: -lquiche
PC

    install COPYING $pkgdir/usr/share/licenses/quiche
}

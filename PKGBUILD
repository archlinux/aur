# Maintainer: Kasei Wang <kasei@kasei.im>

pkgname=quiche
pkgver=0.3.0
pkgrel=1
pkgdesc='an implementation of the QUIC transport protocol and HTTP/3 as specified by the IETF'
arch=('x86_64')
url='https://github.com/cloudflare/quiche'
license=('custom:BSD')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'go' 'rust')
source=("https://github.com/cloudflare/$pkgname/archive/$pkgver.tar.gz"
		"git+https://boringssl.googlesource.com/boringssl#branch=chromium-stable")
sha256sums=('6294db787b684f89ed17836f3bc4cfc99cc394c0a49553fb3652331d68a624b1'
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

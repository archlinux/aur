# Maintainer: Kasei Wang <kasei@kasei.im>

pkgname=quiche
pkgver=0.17.1
pkgrel=1
pkgdesc='an implementation of the QUIC transport protocol and HTTP/3 as specified by the IETF'
arch=('x86_64')
url='https://github.com/cloudflare/quiche'
license=('custom:BSD')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'go' 'rust')
source=("https://github.com/cloudflare/$pkgname/archive/$pkgver.tar.gz"
        "git+https://boringssl.googlesource.com/boringssl#commit=f1c75347daa2ea81a941e953f2263e0a4d970c8d")
sha256sums=('3c427415525da565f726df95021235cdc1c6460aa7d89d1aa3e154cb621d45b4'
            'SKIP')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo fetch --target "$CARCH-unknown-linux-gnu"
  rm -rf quiche/deps/boringssl && ln -s $srcdir/boringssl quiche/deps/boringssl
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --frozen --release --features ffi,pkg-config-meta,qlog
}

check () {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/include
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/lib/pkgconfig
  mkdir -p $pkgdir/usr/share/licenses/quiche

  install -Dm644 quiche/include/quiche.h $pkgdir/usr/include
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

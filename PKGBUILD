# Maintainer: Ning Sun <n@sunng.info>
# Previous Maintainer: Kasei Wang <kasei@kasei.im>

pkgname=quiche
pkgver=0.17.1
pkgrel=4
pkgdesc='an implementation of the QUIC transport protocol and HTTP/2 as specified by the IETF'
arch=('x86_64')
url='https://github.com/cloudflare/quiche'
license=('custom:BSD')
depends=('gcc-libs')
makedepends=('cmake' 'rust')
source=("https://github.com/cloudflare/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('3c427415525da565f726df95021235cdc1c6460aa7d89d1aa3e154cb621d45b4')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --no-default-features --features ffi,pkg-config-meta,qlog,boringssl-boring-crate
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

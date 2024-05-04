# Maintainer: Ning Sun <n@sunng.info>
# Previous Maintainer: Kasei Wang <kasei@kasei.im>

pkgname=quiche
pkgver=0.21.0
pkgrel=1
pkgdesc='an implementation of the QUIC transport protocol and HTTP/2 as specified by the IETF'
arch=('x86_64')
url='https://github.com/cloudflare/quiche'
license=('custom:BSD')
depends=('gcc-libs')
makedepends=('cmake' 'rustup')
options=(!'lto')
source=("https://github.com/cloudflare/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ca0f953c34e1549930cfd44deac5e8a6d9e6c3c3df01e5a2d9bcf6d07246b6a4')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/quiche"
  export RUSTUP_TOOLCHAIN=stable
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/quiche"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --no-default-features --features ffi,pkg-config-meta,qlog,boringssl-boring-crate
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/$pkgname-$pkgver/quiche"
  cargo test --frozen --no-default-features --features ffi,pkg-config-meta,qlog,boringssl-boring-crate
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/include
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/lib/pkgconfig
  mkdir -p $pkgdir/usr/share/licenses/quiche

  install -Dm644 quiche/include/quiche.h $pkgdir/usr/include
  install -Dm644 quiche/target/release/libquiche.a $pkgdir/usr/lib
  install -Dm755 quiche/target/release/libquiche.so $pkgdir/usr/lib
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

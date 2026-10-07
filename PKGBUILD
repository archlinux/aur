# Maintainer: 0xFEEDC0DE64 <daniel@brunner.ninja>
pkgname=cowsync
pkgver=0.1.0
pkgrel=1
pkgdesc='Local filesystem sync tool with copy-on-write cloning'
arch=('x86_64')
url='https://github.com/turadg/cowsync'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3015c90e41ca0cce4c77dca191ac39e6945031bfbf82c8e5b532bf453bce83c3')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/.cargo"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }--remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS:+$RUSTFLAGS }--remap-path-prefix=$srcdir=/usr/src/debug/$pkgname"
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Maintainer: Alessandro Pezzato <alessandro@pezzato.net>

pkgname=lavagna
pkgver=2.1.8
pkgrel=2
pkgdesc='A collaborative blackboard, ideal for simple sketches during online meetings'
arch=(x86_64)
url='https://github.com/alepez/lavagna'
license=(APACHE MIT)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alepez/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('406f313876c551f4ea811be0fa80478c4ec4d020ac86d6516518d9d60e63a9ab')

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --target="$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export RUSTFLAGS="--remap-path-prefix=$(pwd)="
  export CARGO_TARGET_DIR=target

  cargo build --release
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo test
}

package() {
  cd "$pkgname-$pkgver"

  # Executable
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Licenses
  install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

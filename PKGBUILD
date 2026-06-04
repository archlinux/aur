# Maintainer: sigurd4 <sigurd dot spangelo at gmail dot com>

pkgname=freqangel
pkgver=0.1.1
pkgrel=2
pkgdesc="A tool for doing things with SDRAngel frequency csv-files."
url="https://github.com/sigurd4/$pkgname"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL-3.0-only')
depends=(curl)
makedepends=('cargo' 'rust' 'base-devel')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('0c442c912211391d54526d6ea7d7a861f216cbb6a8cdb39b67e8c4b274a798e9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release -- --skip "config"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

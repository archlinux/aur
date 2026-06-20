# Maintainer: sigurd4 <sigurd dot spangelo at gmail dot com>

pkgname=freqangel
pkgver=0.2.0
pkgrel=1
pkgdesc="An utility tool for manipulating SDRAngel frequency csv-files."
url="https://github.com/sigurd4/$pkgname"
arch=('x86_64' 'armv7h' 'aarch64')
license=('GPL-3.0-only')
depends=(curl)
makedepends=('cargo' 'rust' 'base-devel')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('a1856c74b237318fd5ade90df3ccc718c91e7f033530232432c63bbb59802f9c')

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

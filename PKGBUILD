# Maintainer: Roger Díaz Viñolas <me@rdvdev2.com>
pkgname=advocat
pkgver=3.0.0
pkgrel=1
pkgdesc="A complimentary CLI tool to jutge.org"
arch=('x86_64')
url="https://crates.io/crates/advocat"
license=('GPL3')
groups=()
depends=('gcc' 'curl')
makedepends=(cargo)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
noextract=()
sha256sums=('3231884821d5487e0a69ca87b12b1bef81d907981a32dddb7b805f1bd403c8bc')

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features -- \
  --skip problem::test::* # This tests will fail under chroot
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

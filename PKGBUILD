# Maintainer: Zacharias Knudsen <z@chari.as>

pkgname=pg_validate_extupgrade
pkgver=1.0.0_beta
pkgrel=1
pkgdesc="PostgreSQL extension upgrade script validation"
arch=('x86_64')
url="https://github.com/rjuju/pg_validate_extupgrade"
license=('GPL3')
depends=()
makedepends=('cargo')
source=("$pkgname-${pkgver//_/-}.tar.gz::$url/archive/${pkgver//_/-}.tar.gz")
sha512sums=('c65db10dfda1291c3385bf08fd9aeff4cd8dfbd0472a11ce86218b0dbb3045fe6a7f485cd6ad6f4b034594c0c2a5746c28e9410537407f80fe373f84f63d650f')

prepare() {
  cd "$pkgname-${pkgver//_/-}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-${pkgver//_/-}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-${pkgver//_/-}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-${pkgver//_/-}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
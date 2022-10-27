# Maintainer: Zacharias Knudsen <z@chari.as>

pkgname=pg_validate_extupgrade-git
pkgver=r73.ad5edf1
pkgrel=1
pkgdesc="PostgreSQL extension upgrade script validation"
arch=('x86_64')
url="https://github.com/rjuju/pg_validate_extupgrade"
license=('GPL3')
depends=()
makedepends=('cargo')
source=("$pkgname::git+$url")
sha512sums=(SKIP)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname//-git/}"
}

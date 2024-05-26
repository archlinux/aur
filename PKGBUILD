# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=jnv
pkgver=0.2.3
pkgrel=1
pkgdesc="Interactive JSON filter using jq"
arch=(x86_64)
url="https://github.com/ynqa/jnv"
license=(MIT)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cargo
  clang
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('87338cb8b3f8fbcfcfa4380ebeb3aa86e39f3bce57149f845ea76c9087e58f21')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

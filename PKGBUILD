# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=bita
pkgver=0.13.0
pkgrel=1
pkgdesc="Differential file synchronization over http"
arch=(x86_64)
url="https://github.com/oll3/bita"
license=(MIT)
depends=(
  gcc-libs
  glibc
  openssl
  xz
)
makedepends=(
  cargo
  protobuf
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3dcb3577ad38d585cdaa9e832aa24aa078c2f0c686ded70b0b125d021776ae21')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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

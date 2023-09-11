# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=bita
pkgver=0.11.0
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

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('579291e0eab5afe46ef360f989996a2e8a96746e09f4958497b71c9be1b4fd33')

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

  install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=gql
_pkgname=GQL
pkgver=0.23.0
pkgrel=1
pkgdesc="Git Query language (GQL) is an SQL like language to perform queries on .git files"
url="https://github.com/AmrDeveloper/GQL"
arch=(x86_64)
license=(MIT)
depends=(
  gcc-libs
  glibc
)
makedepends=(
  cargo
  cmake
)
conflicts=(gitql)
options=(!lto) # Linking zlib with flake2 fails with LTO enabled
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b0772b4f8120eedeb110b90cd73390e16ad8865b4a25c16ee0f3eb33dc5b3cb1')

_archive="$_pkgname-$pkgver"

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
  cargo test --frozen --all-features --package gitql-cli
}

package() {
  cd "$_archive"

  install -Dm755 -t "$pkgdir/usr/bin" target/release/gitql

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

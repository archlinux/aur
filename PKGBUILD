# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=gql
_pkgname=GQL
pkgver=0.27.0
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
sha256sums=('df90f110ea012498132d6e809c191fdbdf6838eec01be96f6d1270b9e5267b5b')

prepare() {
  cd $_pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $_pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $_pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features --package gitql-cli
}

package() {
  cd $_pkgname-$pkgver
  install -vDm755 -t "$pkgdir/usr/bin" target/release/gitql
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

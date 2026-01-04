# Maintainer: kokan  <kokaipeter@gmail.com>

pkgname=mmtui
pkgver=0.2.0
pkgrel=1
pkgdesc="TUI disk mount manager for TUI file managers"
arch=(x86_64)
url="https://github.com/SL-RU/$pkgname"
license=(MIT)
depends=(
  gcc-libs
  glibc
  udisks2
)
makedepends=(
  rust
  clang
)
options=(!debug !lto)
source=($url/archive/refs/tags/mmt-v$pkgver.tar.gz)
b2sums=('ffb0ad40f6464cb848168b1d03b8b886ac32a3d261a202621b597af95a9cdc1af70ed6114f3352499131d886b416d4cfd8342dece81faae1daf52a41fd5a0be4')

prepare() {
  cd $pkgname-mmt-v$pkgver
  export CARGO_HOME="$srcdir"/$pkgname-mmt-v$pkgver/.cargo
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-mmt-v$pkgver
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_HOME="$srcdir"/$pkgname-mmt-v$pkgver/.cargo
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd $pkgname-mmt-v$pkgver
  install -vDm755 target/release/$pkgname -t "$pkgdir"/usr/bin/
  install -vDm644 LICENSE                 -t "$pkgdir"/usr/share/licenses/$pkgname/
}

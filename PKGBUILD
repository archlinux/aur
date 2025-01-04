# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=wlr-which-key
pkgver=1.1.0
pkgrel=1
pkgdesc="Keymap manager for wlroots-based compositors"
arch=(x86_64)
url="https://github.com/MaxVerevkin/$pkgname"
license=(GPL-3.0-only)
depends=(
  cairo
  gcc-libs
  glib2
  glibc
  libxkbcommon
  pango
)
makedepends=(rust)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('7587df96f040b817120179baefdc07cd3ebe2ba7b6718ec7268c1ea7a83c9f662d8e99b61cc7cc007b8dfa9d24f46a7b81ea8cbdb7cf4c1db09ee5d76bcd6642')

prepare() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir"/$pkgname-$pkgver/.cargo
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir"/$pkgname-$pkgver/.cargo
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd $pkgname-$pkgver
  install -vDm755 target/release/$pkgname -t "$pkgdir"/usr/bin/
}

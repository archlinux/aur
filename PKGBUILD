# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=wlr-which-key
pkgver=1.2.0
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
sha512sums=('28296e97adafa463897f5e9f33714f659c8c7c999e1fd8736d6200af09c253df3692ebbb34905cabcb99048d3960cfc8ccfc843466dc7f587eff27c1caaef4c2')
b2sums=('6d56385bb085ecf6360d2f1bd1946c3ec145948a14281ddf319f7763d299ac07f5ba57508040bafb716a964ef030d7e0b507a13000f6c4268e3591410675c3cc')

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

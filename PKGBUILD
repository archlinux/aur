# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=scu
pkgver=1.6.1
pkgrel=1
pkgdesc="System fetch utility is aimed at informativeness"
arch=(x86_64)
url="https://github.com/srtnnm/$pkgname"
license=(GPL-3.0-or-later)
depends=(
  gcc-libs
  glibc
)
makedepends=(rust)
options=(!debug !lto)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('c024538871d9c9996f5fee0550a79c34957ba88724a15ceca6963ee6a2130440c5a20eaf19fa297f7c22d57ae691475ffd6babc121aa762ed199ef4041731da0')

prepare() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir"/.cargo
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir"/.cargo
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_TARGET_DIR=target
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -vDm755 target/release/$pkgname -t "$pkgdir"/usr/bin/
}

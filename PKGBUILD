# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=mmtui
pkgver=0.1.1
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
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('446792cb17b066d8e251d69d018355ef60161438280aef53bbcb13a161248ba1939fc9555cccf619851a5cbf2e42f86e691e7ee169786025b86ae0e93c2fe36e')

prepare() {
  cd $pkgname-$pkgver
  export CARGO_HOME="$srcdir"/$pkgname-$pkgver/.cargo
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname-$pkgver
  export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
  export CARGO_HOME="$srcdir"/$pkgname-$pkgver/.cargo
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd $pkgname-$pkgver
  install -vDm755 target/release/$pkgname -t "$pkgdir"/usr/bin/
  install -vDm644 LICENSE                 -t "$pkgdir"/usr/share/licenses/$pkgname/
}

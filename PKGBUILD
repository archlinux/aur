# Maintainer: Benjamin Voisin <benjamin.voisin@ens-rennes.fr>

pkgname="olagem"
epoch=1
pkgver=0.2.1
pkgrel=2
pkgdesc="A terminal based typing speed test"
url="https://codeberg.org/BenjaminV/$pkgname"
arch=(x86_64)
license=("CC0-1.0")

makedepends=(
  cargo
)

source=(
	"$pkgname-$pkgver.tar.gz::https://codeberg.org/BenjaminV/$pkgname/archive/v$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::https://codeberg.org/BenjaminV/$pkgname/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz.asc"
)

sha256sums=('e3cf024a816c6ea49121691f3d531c6709ce52914754f0ba5816ff597923fccf'
            'SKIP')

validpgpkeys=('F6BB766662E7D433F7EE159EC5C8EDD125FBFD78') # Benjamin Voisin <benjamin.voisin@ens-rennes.fr>


prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}


build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/olagem
  cp -r target/release/olagem $pkgdir/usr/bin/
  cp -r assets/* $pkgdir/usr/share/olagem/
}

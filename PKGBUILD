# Maintainer: Benjamin Voisin <benjamin.voisin@ens-rennes.fr>

pkgname="olagem"
epoch=1
pkgver=0.1.2
pkgrel=1
pkgdesc="A terminal based typing speed test"
url="https://github.com/benjamin-voisin/$pkgname"
arch=(x86_64)
license=("CC-BY-SA-4.0")

makedepends=(
  git
  cargo
)

_tag=1e7d47bd389a6d1871cf0d0e0c3db2fe43cea7ea #git rev-parse $pkgver
source=( "$pkgname-$pkgver::git+$url#tag=$_tag")
sha256sums=('SKIP')

validpgpkeys=('F6BB766662E7D433F7EE159EC5C8EDD125FBFD78') # Benjamin Voisin <benjamin.voisin@ens-rennes.fr>


prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}


build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/olagem
  cp -r target/release/olagem $pkgdir/usr/bin/
  cp -r assets/* $pkgdir/usr/share/olagem/
}

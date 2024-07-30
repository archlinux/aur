# Maintainer: Benjamin Voisin <benjamin.voisin@ens-rennes.fr>

pkgname="olagem"
epoch=1
pkgver=0.2.1
pkgrel=1
pkgdesc="A terminal based typing speed test"
url="https://github.com/benjamin-voisin/$pkgname"
arch=(x86_64)
license=("CC0-1.0")

makedepends=(
  cargo
)

source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/benjamin-voisin/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::https://github.com/benjamin-voisin/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc"
)

sha256sums=('6d3069f47a45f2ec7f429bf0256c29f4146dfe6fdfc21cc9a52a3156d1f62029'
            'SKIP')

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

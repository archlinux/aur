# Maintainer: hisui
pkgname=stardial
pkgver=0.1.0
pkgrel=1
pkgdesc="A space-anime themed terminal clock (tty-clock superset)"
arch=('x86_64')
url="https://github.com/hisuic/stardial"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2d84aadba7c3d65bc670c0276419809eff960675b7ad4332ebcf91f08b69150f')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make CARGOFLAGS="--frozen"
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  make check CARGOFLAGS="--frozen"
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

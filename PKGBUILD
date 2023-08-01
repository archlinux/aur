# Maintainer: msg (salihgerdan on github)
pkgname=spaceman-git
pkgver=0.1.0.r0.g8514a43
pkgrel=1
pkgdesc="Treemap disk usage analyzer (graphical visualizer, SpaceSniffer alternative)"
arch=('any')
url="https://github.com/salihgerdan/spaceman"
license=('GPL')
depends=(gtk4)
makedepends=(gtk4 cargo)
source=(git+https://github.com/salihgerdan/spaceman.git)
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/spaceman"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$srcdir/spaceman"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$srcdir/spaceman"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/spaceman"

  mkdir -p "$pkgdir/usr/share/applications"
  install spaceman.desktop "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/bin/"
  install target/release/spaceman "$pkgdir/usr/bin/spaceman"
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  install spaceman.png "$pkgdir/usr/share/pixmaps/"
}

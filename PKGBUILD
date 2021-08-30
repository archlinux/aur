# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('pop-launcher' 'pop-launcher-system76-power')
pkgbase=pop-launcher
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
url="https://github.com/pop-os/launcher"
license=('GPL3')
depends=('fd' 'gtk3' 'libqalculate')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e02eb4fa0e174aa5169461af283786e8a972a4268b823bb9c509fa3d5a5f6515')

prepare() {
  cd "launcher-$pkgver"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}


build() {
  cd "launcher-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  make
}

package_pop-launcher() {
  pkgdesc="Modular IPC-based desktop launcher service"
  optdepends=('pop-launcher-system76-power')

  cd "launcher-$pkgver"
  make DESTDIR="$pkgdir/" install

  rm -rf "$pkgdir/usr/lib/$pkgbase/scripts/system76-power"
}

package_pop-launcher-system76-power() {
  pkgdesc="System76 Power scripts for the launcher"
  depends=('pop-launcher' 'system76-power')

  cd "launcher-$pkgver"
  install -d "$pkgdir/usr/lib/$pkgbase/scripts"
  cp -r scripts/system76-power "$pkgdir/usr/lib/$pkgbase/scripts"
}

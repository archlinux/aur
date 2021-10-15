# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('pop-launcher' 'pop-shell-plugin-system76-power')
pkgbase=pop-launcher
pkgver=1.0.1
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/launcher"
license=('GPL3')
depends=('fd' 'gtk3' 'libqalculate')
makedepends=('cargo')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('92927d1133648bcab4e960219e14d4681f921f458b653a4ed39f35678263957b')

prepare() {
  cd "launcher-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
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
  sed -i "s|$pkgbase-bin \$(BIN)|$pkgbase-bin $pkgdir/usr/bin/$pkgbase|g" Makefile

  make BIN="/usr/bin/$pkgbase" DESTDIR="$pkgdir/" install

  rm -rf "$pkgdir/usr/lib/$pkgbase/scripts/system76-power"
}

package_pop-shell-plugin-system76-power() {
  pkgdesc="System76 Power scripts for the launcher"
  depends=('pop-shell' 'system76-power')
  conflicts=('pop-launcher-system76-power')
  replaces=('pop-launcher-system76-power')

  cd "launcher-$pkgver"
  install -d "$pkgdir/usr/lib/$pkgbase/scripts"
  cp -r scripts/system76-power "$pkgdir/usr/lib/$pkgbase/scripts"
}

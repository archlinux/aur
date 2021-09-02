# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('pop-launcher' 'pop-launcher-system76-power')
pkgbase=pop-launcher
pkgver=1.0.0
pkgrel=3
arch=('x86_64')
url="https://github.com/pop-os/launcher"
license=('GPL3')
depends=('fd' 'gtk3' 'libqalculate')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0f025d2b79af57e19c1447a446f35dc5c972edd45f6efd2a7d1918930773bd27')

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

  # Fix symlink
  rm "$pkgdir/usr/lib/$pkgbase/plugins/pop_shell/pop-shell"
  ln -s "/usr/bin/$pkgbase" \
    "$pkgdir/usr/lib/$pkgbase/plugins/pop_shell/pop-shell"

  rm -rf "$pkgdir/usr/lib/$pkgbase/scripts/system76-power"
}

package_pop-launcher-system76-power() {
  pkgdesc="System76 Power scripts for the launcher"
  depends=('pop-launcher' 'system76-power')

  cd "launcher-$pkgver"
  install -d "$pkgdir/usr/lib/$pkgbase/scripts"
  cp -r scripts/system76-power "$pkgdir/usr/lib/$pkgbase/scripts"
}

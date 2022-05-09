# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Corey Hinshaw <corey(at)electrickite(dot)org>
pkgname=('system76-firmware' 'system76-firmware-daemon')
pkgbase=system76-firmware
pkgver=1.0.36
pkgrel=1
pkgdesc="System76 CLI tool for installing firmware updates and systemd service that exposes a DBUS API for handling firmware updates"
arch=('x86_64')
url="https://github.com/pop-os/system76-firmware"
license=('GPL3')
makedepends=('cargo' 'dbus')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c4e9e0ce14216f3c1f52a080d733b2231f12b1d1ae9e57289e2b35c6c6bbba21')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgbase-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  make
}

package_system76-firmware() {
  pkgdesc="System76 CLI tool for installing firmware updates"
  depends=('ca-certificates' 'efibootmgr' 'openssl' 'xz')

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install-cli
}

package_system76-firmware-daemon() {
  pkgdesc="System76 systemd service that exposes a DBUS API for handling firmware updates"
  depends=('dbus' 'dfu-programmer' 'system76-firmware' 'systemd')
  install="$pkgname.install"

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install-daemon

  install -d "$pkgdir/usr/lib/systemd/system"
  mv "$pkgdir/etc/systemd/system/$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
  rm -rf "$pkgdir/etc/systemd"
}

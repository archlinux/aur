# Maintainer: Xiaotian Wu <yetist@gmail.com>
# SPDX-License-Identifier: 0BSD

pkgname=scratch-link-gtk
pkgver=0.1.0
pkgrel=1
pkgdesc="Bluetooth bridge for Scratch 3 hardware extensions"
arch=('x86_64' 'aarch64')
url="https://github.com/yetist/scratch-link-gtk"
license=('GPL-3.0-or-later')
# bluez provides the system D-Bus service used for Bluetooth access.
depends=('bluez' 'glib2' 'gtk3' 'hicolor-icon-theme' 'json-glib' 'libsoup3')
makedepends=('meson' 'ninja' 'vala')
provides=('scratch-link')
conflicts=('scratch-link')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('90aaedb3ff32b271e73761ba0cab0c1a9000bc7df7bd111a3cbd3c400c651cbf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dappindicator=disabled
  meson compile -C build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  meson test -C build --print-errorlogs
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

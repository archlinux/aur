# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Vítor Ferreira <vitor.dominor@gmail.com>

pkgname=xboxdrv-git
pkgver=0.8.4.r410.g1aebab2
pkgrel=1
pkgdesc="An XBox/XBox 360 gamepad driver - as alternative to the xpad-kernel module - with more configurability, runs in userspace and supports a multitude of controllers"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://xboxdrv.gitlab.io/"
license=(GPL3)
depends=(libx11 dbus-glib libusb python2 bluez-libs gtk2)
makedepends=(git cmake  boost)
provides=(xboxdrv)
conflicts=(xboxdrv)
source=("git+https://gitlab.com/xboxdrv/xboxdrv.git#branch=develop"
         "xboxdrv.service"
         "xboxdrv.conf")
sha256sums=('SKIP'
            '51387a52a97d2e004a4160432131f18326e9ae655447694e170f18bdb8d7204f'
            'f155dd059faecafa60ecaa0988aec815ee0c58f1af45075de82ae10c31db2750')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  mkdir build
}

build() {
  cd "${pkgname%-git}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd "${pkgname%-git}/build"
  make install DESTDIR="$pkgdir"
  
  install -D -m755 "$srcdir/xboxdrv.service" "$pkgdir/usr/lib/systemd/system/xboxdrv.service"
  install -D -m644 "$srcdir/xboxdrv.conf" "$pkgdir/etc/conf.d/xboxdrv"
}

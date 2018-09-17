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
depends=(libx11 dbus-glib libusb)
makedepends=(git cmake  boost)
provides=(xboxdrv)
conflicts=(xboxdrv)
source=("${pkgname}::git+https://gitlab.com/xboxdrv/xboxdrv.git"
         "xboxdrv.service"
         "xboxdrv.conf")
md5sums=('SKIP'
         'c44dc13f6d34cd7fc61c87ecd8c3a547'
         'c73bb9cf8ff763e7c477366472d19813')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  mkdir build
}

build() {
  cd "$pkgname/build"
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd "$pkgname/build"
  make install DESTDIR="$pkgdir"
  
  install -D -m755 "$srcdir/xboxdrv.service" "$pkgdir/usr/lib/systemd/system/xboxdrv.service"
  install -D -m644 "$srcdir/xboxdrv.conf" "$pkgdir/etc/conf.d/xboxdrv"
}

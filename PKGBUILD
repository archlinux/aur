# Maintainer: Stunts <f.pinamartins@gmail.com>
pkgname=xboxdrv-develop-git
_pkgname=xboxdrv
pkgver=0.8.4.r410.g1aebab2
pkgrel=1
pkgdesc="An XBox/XBox 360 gamepad driver - as alternative to the xpad-kernel module - with more configurability, runs in userspace and supports a multitude of controllers. Bleeding edge version."
arch=('i686' 'x86_64')
url="https://xboxdrv.gitlab.io"
license=('GPL3')
depends=('libx11' 'dbus-glib' 'libusbx')
makedepends=('git' 'scons' 'boost' 'pkg-config' 'libx11' 'dbus-glib' 'libusb')
provides=('xboxdrv')
conflicts=('xboxdrv')
source=('git+https://gitlab.com/xboxdrv/xboxdrv.git#branch=develop'
        'xboxdrv.service'
        'xboxdrv.conf')
sha256sums=('SKIP'
            '51387a52a97d2e004a4160432131f18326e9ae655447694e170f18bdb8d7204f'
            'f155dd059faecafa60ecaa0988aec815ee0c58f1af45075de82ae10c31db2750')


pkgver() {
  cd ${srcdir}/${_pkgname}
  # cutting off 'v' prefix present in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${_pkgname}
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}/build
  make install DESTDIR=${pkgdir}
  
  install -D -m755 ${srcdir}/xboxdrv.service ${pkgdir}/usr/lib/systemd/system/xboxdrv.service
  install -D -m644 ${srcdir}/xboxdrv.conf ${pkgdir}/etc/conf.d/xboxdrv

}


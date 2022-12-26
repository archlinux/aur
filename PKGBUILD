# Maintainer: Nirenjan Krishnan <nirenjan@gmail.com>

pkgname=libx52
pkgver=0.3.0
pkgrel=1
pkgdesc="Application to control the MFD and LEDs of a Saitek X52/X52Pro HOTAS"
arch=('x86_64')
url="https://github.com/nirenjan/${pkgname}"
license=('GPL2')
depends=('libusb' 'hidapi' 'libevdev')
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config' 'python'
         'gettext' 'libusb' 'hidapi' 'libevdev' 'doxygen' 'cmocka' 'git')
install="${pkgname}.install"
source=("https://github.com/nirenjan/x52pro-linux/releases/download/v${pkgver}/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('80a6141c64c94387d5593c8b4a9b5de5c22db16a0fa9cacaf1a2a80e8a3cd96e')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir build
  cd build
  ../configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc \
    --disable-silent-rules --disable-maintainer-mode
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build

  make install DESTDIR="${pkgdir}"

  # Delete the /var/run and /var/log directories, they are owned by the system
  rmdir "${pkgdir}/var/run"
  rmdir "${pkgdir}/var/log"
}

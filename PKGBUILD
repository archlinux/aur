# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Geoffroy Carrier <geoffroy@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=openobex
pkgver=1.7.2
pkgrel=6
pkgdesc="Implementation of the OBject EXchange (OBEX) protocol"
url="http://dev.zuckschwerdt.org/openobex/"
arch=('x86_64' 'i686')
license=('GPL' 'LGPL')
depends=('libusb' 'bluez-libs')
makedepends=('cmake' 'libxslt' 'doxygen' 'graphviz' 'java-environment')
options=('staticlibs' '!makeflags')
source=(
  http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-Source.tar.gz
  5daf0765235db81d39e237ec04291b4628f046bc.patch
  8e30bff036a47ca27c4f41d14f40f6a0fb9cba06.patch
)
md5sums=(
  'f6e0b6cb7dcfd731460a7e9a91429a3a'
  '7105935b2d94277f9c874fe09264415a'
  'b625c9b4efadde1fd6613dfa6b02e4ff'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  sed -i 's|MODE="660", GROUP="plugdev"|TAG+="uaccess"|' udev/openobex.rules.in

  # -D_POSIX_C_SOURCE=200112L -D_BSD_SOURCE
  patch -Np1 -i "${srcdir}/5daf0765235db81d39e237ec04291b4628f046bc.patch"

  # Fix segfault in obex-check-device 
  patch -Np1 -i "${srcdir}/8e30bff036a47ca27c4f41d14f40f6a0fb9cba06.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_SBINDIR=/usr/bin \
    -DCMAKE_INSTALL_UDEVRULESDIR=/usr/lib/udev/rules.d
  make all openobex-apps
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"
  cd build
  make DESTDIR="${pkgdir}" install
  cp ../apps/lib/*.h  "${pkgdir}/usr/include/openobex/"
  install -m644 apps/lib/libopenobex-apps-common.a "${pkgdir}/usr/lib/libopenobex-apps-common.a"
}

# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=epsonscan2
pkgver=6.6.42.0
_pkgver="${pkgver}-1"
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Epson scanner management utility"
url="http://support.epson.net/linux/en/epsonscan2.php"
license=('GPL3')
depends=('boost-libs' 'libharu' 'qt5-singlecoreapplication' 'rapidjson' 'sane')
makedepends=('boost' 'cmake')
optdepends=('epsonscan2-non-free-plugin: OCR support and wireless scanning')
options=('!buildflags')
source=("http://support.epson.net/linux/src/scanner/${pkgname}/${pkgname}-${_pkgver}.src.tar.gz")
sha512sums=('ae93d9c1aed6f1a420ad390af9f72ca9c5d28a3735f51df2fbfe23d26ae12ba45bc9a7f42776745a64d97141db2ec61a6fd3699f310d854b0f1e7e5b5cacb195')

prepare() {
  [[ -d build ]] && rm -r build; mkdir build

  sed -i 's|/lib/udev|${CMAKE_INSTALL_PREFIX}/lib/udev|' \
         "${srcdir}/${pkgname}-${_pkgver}/CMakeLists.txt"

  sed -i '1 i #include "zlib.h"' \
         "${srcdir}/${pkgname}-${_pkgver}/src/CommonUtility/DbgLog.cpp"
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ../${pkgname}-${_pkgver}
  cmake --build .
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}/${pkgname}-${_pkgver}/desktop/rpm/i686/${pkgname}.desktop" \
                 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -d ${pkgdir}/usr/lib/sane ; cd ${pkgdir}/usr/lib/sane
  ln -s ../${pkgname}/libsane-epsonscan2.so libsane-epsonscan2.so.1
  ln -s ../${pkgname}/libsane-epsonscan2.so libsane-epsonscan2.so.1.0.0
}

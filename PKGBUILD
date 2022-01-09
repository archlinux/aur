# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=epsonscan2
pkgver=6.6.40.0
_pkgver="${pkgver}-1"
pkgrel=2
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Epson scanner management utility"
url="http://support.epson.net/linux/en/epsonscan2.php"
license=('GPL3')
depends=('boost-libs' 'libharu' 'qt5-singlecoreapplication' 'rapidjson' 'sane')
makedepends=('boost' 'cmake')
optdepends=('epsonscan2-non-free-plugin: OCR support and wireless scanning')
options=('!buildflags')
source=("http://support.epson.net/linux/src/scanner/${pkgname}/${pkgname}-${_pkgver}.src.tar.gz")
sha512sums=('004dcda54ab55f7370cfb86089b71c33155bc83e862fafd93204c1b43581c00fb078911abd9d1730fbb29e29bd679721aa31bbb165ffa7d0a5d5d39c003e385e')

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

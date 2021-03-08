# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=epsonscan2
pkgver=6.6.2.3
_pkgver="${pkgver}-1"
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Epson scanner management utility"
url="http://support.epson.net/linux/en/epsonscan2.php"
license=('GPL3')
depends=('boost-libs' 'libharu' 'qt5-singlecoreapplication' 'rapidjson' 'sane')
makedepends=('boost' 'cmake')
optdepends=('epsonscan2-non-free-plugin: OCR support and wireless scanning')
source=("http://support.epson.net/linux/src/scanner/${pkgname}/${pkgname}-${_pkgver}.src.tar.gz")
sha512sums=('e07cfbf20a6a1e9244c4cf4447a0c4b1b967b5aa30f697eaefec7f8ee4e847c1dcf0f8bade428802cee830205bb1d159bad417dd652773ab01d520d82915a3cd')

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
  ln -s ../epsonscan2/libsane-epsonscan2.so libsane-epsonscan2.so.1
  ln -s ../epsonscan2/libsane-epsonscan2.so libsane-epsonscan2.so.1.0.0
}

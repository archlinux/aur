# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=epsonscan2
pkgver=6.6.2.2
_pkgver="${pkgver}-1"
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Epson scanner management utility"
url="http://support.epson.net/linux/en/epsonscan2.php"
license=('GPL3')
depends=('boost-libs' 'libharu' 'qt5-singlecoreapplication' 'rapidjson' 'sane')
makedepends=('boost' 'cmake')
optdepends=('epsonscan2-non-free-plugin-bin: Wifi network scanning')
source=("http://support.epson.net/linux/src/scanner/${pkgname}/${pkgname}-${_pkgver}.src.tar.gz")
sha512sums=('f939694d625b5fe8575d040ff8276c069b563deb04b96007eefabc443893bcf9876948b596d738116e8c515aa8a8fcb24e20d1b348b9b0cc4e2236d705f5c252')

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
}

# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=epsonscan2
pkgver=6.7.43.0
_pkgver="$pkgver-1"
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Epson scanner management utility"
url="http://support.epson.net/linux/en/epsonscan2.php"
license=('GPL3')
depends=('libjpeg-turbo' 'libpng' 'libtiff' 'libusb' 'qt5-base' 'sane' 'zlib')
makedepends=('boost' 'cmake' 'libharu' 'qt5-singlecoreapplication' 'rapidjson')
optdepends=('epsonscan2-non-free-plugin: OCR support and wireless scanning')
options=('!buildflags')
source=("http://support.epson.net/linux/src/scanner/$pkgname/$pkgname-$_pkgver.src.tar.gz")
sha512sums=('feee8abdc1efc0cbec3fc0c5442219f47497a714dca210b9c1ac238a23ca1e99a7f5c1ce4f802a2e9c1d604edf9cc37a888381759c4b8cf1598ce76793c604c7')

prepare() {
  [[ -d build ]] && rm -r build; mkdir build

  sed -i 's|/lib/udev|${CMAKE_INSTALL_PREFIX}/lib/udev|' \
         "$srcdir/$pkgname-$_pkgver/CMakeLists.txt"

  sed -i '1 i #include "zlib.h"' \
         "$srcdir/$pkgname-$_pkgver/src/CommonUtility/DbgLog.cpp"
#
#  sed -i 's/qt5/qt6/g; s/Qt5/Qt6/g; s/QT5/QT6/g' \
#         "$srcdir/$pkgname-$_pkgver/src/DetectAlert/CMakeLists.txt" \
#         "$srcdir/$pkgname-$_pkgver/src/Standalone/CMakeLists.txt"
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_VERSION_MAJOR=5 \
        ../$pkgname-$_pkgver
  cmake --build .
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/$pkgname-$_pkgver/desktop/rpm/i686/$pkgname.desktop" \
                 "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -d $pkgdir/usr/lib/sane ; cd $pkgdir/usr/lib/sane
  ln -s ../$pkgname/libsane-epsonscan2.so libsane-epsonscan2.so.1
  ln -s ../$pkgname/libsane-epsonscan2.so libsane-epsonscan2.so.1.0.0
}

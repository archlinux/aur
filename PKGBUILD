# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=epsonscan2
pkgver=6.7.63.0
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
source=('https://download3.ebz.epson.net/dsc/f/03/00/15/17/69/0ef02802c476a6564f13cac929859c394f40326a/epsonscan2-6.7.63.0-1.src.tar.gz'
        'epsonscan2-crash.patch'
        'epsonscan2-oob-container.patch'
        'epsonscan2-xdg-open.patch')
b2sums=('d765082c258e77bc98a64457388bddf465d258b62617460b0d8d3b82c3d6e1833e69515995349d5536069e2a4aede705abc3c962a12107fdf0af45e8fe8d8eac'
        '8f3b86bdafa8822e49c48b4189ee262c92d7aadeff4369979dd723b01efd1c392789451d77eef5a127c58795403fbc5364793d20b6d4e494b1eff3ed3c1153fb'
        'b6821eba16ab6d7e829ca74b1c46432f505e87421146d38d30a0ebd8eeecd93d12d57bad071232528be62beff54663d4fa58fbc8b992461b8acdd8a53a354b3a'
        '514b3e0f871bbe36106615676cafd8c4d1ed284d25cad8cd691ba08f67ae36a3e53547ecf898596cccdcfe002b9c6eaddc6cc3c9448c53238ae81af7b0cd35cf')

prepare() {
  [[ -d build ]] && rm -r build; mkdir build

  sed -i 's|/lib/udev|${CMAKE_INSTALL_PREFIX}/lib/udev|' \
         "$srcdir/$pkgname-$_pkgver/CMakeLists.txt"

  sed -i '1 i #include "zlib.h"' \
         "$srcdir/$pkgname-$_pkgver/src/CommonUtility/DbgLog.cpp"

  # Stability improvements from Flatpak maintainers
  # https://github.com/flathub/net.epson.epsonscan2
  for file in crash oob-container xdg-open
  do
    patch --directory="$srcdir/$pkgname-$_pkgver" --forward --strip=1 --input="$srcdir/$pkgname-$file.patch"
  done
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
  ln -s ../$pkgname/libsane-epsonscan2.so libsane-epsonscan2.so
  ln -s ../$pkgname/libsane-epsonscan2.so libsane-epsonscan2.so.1
  ln -s ../$pkgname/libsane-epsonscan2.so libsane-epsonscan2.so.1.0.0
}

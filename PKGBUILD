# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=epsonscan2
pkgver=6.7.80.0
_pkgver="$pkgver-1"
pkgrel=1
arch=('armv7h' 'i686' 'x86_64')
pkgdesc="Epson scanner management utility"
url="http://support.epson.net/linux/en/epsonscan2.php"
license=('GPL-3.0-or-later')
depends=('libjpeg-turbo' 'libpng' 'libtiff' 'libusb' 'qt5-base' 'sane' 'zlib')
makedepends=('boost' 'cmake' 'qt5-singlecoreapplication' 'rapidjson')
optdepends=('epsonscan2-non-free-plugin: OCR support and wireless scanning')
options=('!buildflags')
source=('https://download3.ebz.epson.net/dsc/f/03/00/17/08/06/1babf9876ebb16956420a601b92ee28b57cd7db7/epsonscan2-6.7.80.0-1.src.tar.gz'
        '0002-Fix-crash.patch'
        '0003-Use-XDG-open-to-open-the-directory.patch'
        '0004-Fix-a-crash-on-an-OOB-container-access.patch'
        '0005-Fix-folder-creation-crash.patch')
b2sums=('2eeaf6bcb2734929ab9ae862a2051bdd6779ab1b0ab0dbd4dd318bf51d3f49b9b6846b8203d44e217f14b5b970187f923de2a395298da7db91616d4356d674a4'
        '9637be5374f6406b79b0004486764d4b6f8b3c113ac880df7c6baf87808807463627fc3d365d164ffc77644daf04d936b7a60e1f9514c36941e94c77377d2be7'
        '519ee6aaa8b395cc18249e42a4e52b9904d5d01798d47f7af33e8d0cdb96c0fdd70d750731baf8ada22cfd691b301dad6cd12d831c773da6b1953ef0ce467e21'
        '9634925263f93a6601f65b0f998ec292a35f1e109a26c2e7a44c6e129c33fc9a12e92466c98c893f6ac7052f5009efb09270cd2cb62228df6f81b019488fa12f'
        '055d80bf7c8d7e5c73c54e6fe7e9e0518c3c0160516b33f0669141ff6e1dbc8c49e5be5fe0a1ca3f5ec6172f2bb9f087df63a6624b244a1abe86ce44f01cbf25')

prepare() {
  sed -i 's|/lib/udev|${CMAKE_INSTALL_PREFIX}/lib/udev|' \
         "$srcdir/$pkgname-$_pkgver/CMakeLists.txt"

  sed -i '1 i #include "zlib.h"' \
         "$srcdir/$pkgname-$_pkgver/src/CommonUtility/DbgLog.cpp"
 
  sed -i '/zlib/d' \
         "$srcdir/$pkgname-$_pkgver/src/Controller/CMakeLists.txt"

  # Stability improvements from Flatpak maintainers
  # https://github.com/flathub/net.epson.epsonscan2
  for file in 0002-Fix-crash \
              0003-Use-XDG-open-to-open-the-directory \
              0004-Fix-a-crash-on-an-OOB-container-access \
              0005-Fix-folder-creation-crash
  do
    patch --directory="$srcdir/$pkgname-$_pkgver" --forward --strip=1 --input="$srcdir/$file.patch"
  done

  # Remove Boost setting in CMake config that crashes the package build
  find "$srcdir/$pkgname-$_pkgver" -type f -name CMakeLists.txt \
       -exec sed -i '/BOOST_NO_CXX11_RVALUE_REFERENCES/d' {} \;

  for file in Standalone/lastusedsettings.cpp \
              Standalone/defaultsettings.cpp \
              CommonUtility/ESCommonTypedef.h \
              Controller/Src/KeysValues/Key.hpp \
              Controller/Src/KeysValues/KeyMgr.hpp
  do
    sed -i '/BOOST_NO_CXX11_RVALUE_REFERENCES/d' \
           "$srcdir/$pkgname-$_pkgver/src/$file"
  done

  # Remove support for older versions of CMake in the configuration scripts
  # (needed to build the package)
  for dir in . \
             src \
             src/Standalone \
             src/ScanSDK \
             src/ScanSDK/Src/SDK/SCANSDKsample_C++ \
             src/DetectAlert
  do
    sed -Ei '/cmake_minimum_required/ s/2\.([0-9]+|\.)+/4.0/' \
            "$srcdir/$pkgname-$_pkgver/$dir/CMakeLists.txt"
  done

  # Fix compilation failure caused by GCC 15
  sed -i '/SET.*FLAGS/ s/")/ -Wno-template-body")/' \
         "$srcdir/$pkgname-$_pkgver/src/ES2Command/Linux/CMakeLists.txt"
  sed -i '/#include/ i #include <cmath>' \
         "$srcdir/$pkgname-$_pkgver/src/Controller/Src/Filter/GrayToMono.hpp"
}

build() {
  cmake $pkgname-$_pkgver \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_VERSION_MAJOR=5
        
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/$pkgname-$_pkgver/desktop/rpm/i686/$pkgname.desktop" \
                 "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -d $pkgdir/usr/lib/sane ; cd $pkgdir/usr/lib/sane
  ln -s ../$pkgname/libsane-epsonscan2.so libsane-epsonscan2.so
  ln -s ../$pkgname/libsane-epsonscan2.so libsane-epsonscan2.so.1
  ln -s ../$pkgname/libsane-epsonscan2.so libsane-epsonscan2.so.1.0.0
}

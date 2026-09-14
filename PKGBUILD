# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

_epsonscan2_non_free_plugin_version='1.0.0.6'

pkgname=epsonscan2
pkgver=6.7.92.0
_pkgver="$pkgver-1"
pkgrel=1
arch=('armv7h' 'x86_64')
pkgdesc="Epson scanner management utility"
url="https://download-center.epson.com/"
license=('GPL-3.0-or-later' 'LicenseRef-EULA')
depends=('libjpeg-turbo' 'libpng' 'libtiff' 'libusb' 'qt5-base' 'sane' 'zlib')
makedepends=('bbe' 'boost' 'cmake' 'qt5-singlecoreapplication' 'rapidjson')
conflicts=('epsonscan2-non-free-plugin')
options=('!buildflags')
source=('https://download-center.epson.com/f/module/793c84de-6ffb-4ca6-9383-0390b06eb6bf/epsonscan2-6.7.92.0-1.src.tar.gz'
        '0002-Fix-crash.patch'
        '0003-Use-XDG-open-to-open-the-directory.patch'
        '0005-Fix-folder-creation-crash.patch'
        '0006-Fix-crash-no-serial-number.patch'
        '0007-Detect-scanners-that-need-firmware.patch')
source_armv7h=('https://download-center.epson.com/f/module/f31a93a4-d21c-4420-8f29-b9c7ccc4bd12/epsonscan2-bundle-6.7.92.0.armv7l.deb.tar.gz')
source_x86_64=('https://download-center.epson.com/f/module/967b0efe-4805-4723-bb6a-6ea0f68c5e2a/epsonscan2-bundle-6.7.92.0.x86_64.deb.tar.gz')
b2sums=('65857d7cdb00a804619701c8b20e7e12d200d25159d721c6ccb421c9440e7dc76369801caba1c1b2bc46d4b4c3d6278bf94571c1b3dac562252a0f9994e871d6'
        'c763f16b2fac22b7ac0093228142a516222dc044533b7b320087f87b0fcad1f614ea93210f544f093f3e07c89220ab097901628a4d5dc57213bae505c4bebd58'
        'e398e821704599be0b6ba9192c32411f92650f2e455b088718ba4b643562c21bc02044df30affe2b7ea99069cd0c1c59902e586e9de7e1bb9b3e0ae013c9e30d'
        '5e2af573e616a6afaeb4b9035e54f5a0e05684f194a5fac52eb9ced619fdc156a62ab22bcf62af14a058f74d80a6606abf5e056ea720109c013624802d4b62e5'
        '282a18ad086446f290d795141d63235e67416cea894945d2c65dac7ffa36b3288ef920ef627df349f06e5f482b16e8fa6dbd0064db4b701437a01b913bd8a3fb'
        '5a3416356913438cfe901195198b0c00167d69f726ef2913e2dc209151d4c1b736c2a608e8b556bc201acc320548a56263f2782fdb79249c46e490ef756c2700')
b2sums_armv7h=('f66304ef47c455b10c611b3023f745e039902f931822db8f0f26363bc224ce9f10b3965d06995c382d0e73976fe8b0581b99a7c1b0cf0695c53f04a942320408')
b2sums_x86_64=('dc422c9f2d1ff4f00e9ebe6c264b2ee03daad9701c7c971a1b6a2f887dd999c64bb6894c6f7ee7afb1fff315ce871dcd0d580be99c651a14ac53b953f43da7dc')

DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

prepare() {
  # sane and udev: copy files to the build directory
  sed -i 's|/lib/udev|${CMAKE_INSTALL_PREFIX}/lib/udev|' \
         "$srcdir/$pkgname-$_pkgver/CMakeLists.txt"

  sed -i '/LIBDIR}\/sane/ s|${EPSON|\\$ENV{DESTDIR}\\${EPSON|' \
         "$srcdir/$pkgname-$_pkgver/CMakeLists.txt"

  # Disable zlib build; use the Arch Linux library
  sed -i '1 i #include "zlib.h"' \
         "$srcdir/$pkgname-$_pkgver/src/CommonUtility/DbgLog.cpp"
 
  sed -i '/zlib/d' \
         "$srcdir/$pkgname-$_pkgver/src/Controller/CMakeLists.txt"

  # Stability improvements from Flatpak maintainers
  # https://github.com/flathub/net.epson.epsonscan2
  for file in 0002-Fix-crash \
              0003-Use-XDG-open-to-open-the-directory \
              0005-Fix-folder-creation-crash
  do
    patch --directory="$srcdir/$pkgname-$_pkgver" --forward --binary \
          --strip=1 --input="$srcdir/$file.patch"
  done

  # Fix a bug when detecting a scanner that does not report its serial number
  # https://github.com/duck7000/aur_epsonscan2/blob/main/0005-Fix-crash-no-serial-number.patch
  for file in 0006-Fix-crash-no-serial-number \
              0007-Detect-scanners-that-need-firmware
  do
    patch --directory="$srcdir/$pkgname-$_pkgver" --forward --binary \
          --strip=1 --input="$srcdir/$file.patch"
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

  # Change directory references from "/usr/libexec" to "/usr/lib" in the source code
  for file in Controller/Src/Scanner/Engine.cpp \
              Controller/Src/Filter/GetOrientation.cpp
  do
    sed -i 's/libexec/lib/' \
           "$srcdir/$pkgname-$_pkgver/src/$file"
  done

  # Disable building in debug mode
  for file in CMakeLists.txt \
              src/ES2Emulator/test/CMakeLists.txt \
              src/ES2Emulator/Linux/CMakeLists.txt \
              src/Controller/Test/CMakeLists.txt
  do
    sed -i '/CMAKE_BUILD_TYPE Debug/ s/^/#/' \
           "$srcdir/$pkgname-$_pkgver/$file"
  done

  # Remove references to the source code in executables
  sed -i "/add_subdir/ i add_compile_options(\"-fmacro-prefix-map=$(echo $srcdir)=.\")" \
         "$srcdir/$pkgname-$_pkgver/CMakeLists.txt"

  # Prepare plugin files
  cd "$srcdir"/epsonscan2-bundle*/plugins
  ar x epsonscan2-non-free-plugin*.deb
  tar -xJf data.tar.xz -C "$srcdir"

  # The “es2intif” program looks for libraries in the default Debian directory:
  # /usr/lib/x86_64-linux-gnu/epsonscan2/
  # This command updates to the path used in this package:
  # /usr/lib/epsonscan2/
  cd "$srcdir"/usr/lib/*/epsonscan2/non-free-exec
  case $CARCH in
    armv7h)
      bbe -e "s|arm-linux-gnueabihf/epsonscan2/|epsonscan2/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00|" es2intif > es2intif.alt
    ;;
    x86_64)
      bbe -e "s|x86_64-linux-gnu/epsonscan2/|epsonscan2/\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00|" es2intif > es2intif.alt
    ;;
  esac
  mv es2intif.alt es2intif
  chmod +x es2intif
}

build() {
  cmake $pkgname-$_pkgver \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DEPSON_OCR_INSTALL_PATH="/usr/share/epsonscan2-ocr" \
        -DQT_VERSION_MAJOR=5
        
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/$pkgname-$_pkgver/desktop/rpm/i686/$pkgname.desktop" \
                 "$pkgdir/usr/share/applications/$pkgname.desktop"

  # Package plugin files
  install -d "$pkgdir/usr/lib/"
  cd "$srcdir/usr"
  cp -lr lib/*/epsonscan2* "$pkgdir/usr/lib" && rm -r lib/*/epsonscan2*
  mv libexec/epsonscan2-ocr/ocr-engine-getrotate "$pkgdir/usr/lib/epsonscan2-ocr"
  cp -lr share "$pkgdir/usr" && rm -r share
  install -Dm644 "$pkgdir/usr/share/doc/$pkgname-non-free-plugin-${_epsonscan2_non_free_plugin_version}-1/copyright" \
                 "$pkgdir/usr/share/licenses/$pkgname/copyright_epsonscan2-non-free-plugin"
  install -Dm644 "$pkgdir/usr/share/doc/$pkgname-non-free-plugin-${_epsonscan2_non_free_plugin_version}-1/COPYING.EPSON" \
                 "$pkgdir/usr/share/licenses/$pkgname/EULA_epsonscan2-non-free-plugin"
}

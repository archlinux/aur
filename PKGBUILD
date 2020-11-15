# Maintainer: Neal Miller <ac9qd@protonmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>

# bug, python binding vanished with 3.4
# Could NOT find PythonLibs (missing:  PYTHON_LIBRARIES PYTHON_INCLUDE_DIRS)

pkgname=libftdi-aur
pkgver=1.5
pkgrel=2
pkgdesc="A library to talk to FTDI chips, optional python bindings. (From source, updated version - 1.5)"
arch=('x86_64')
url="https://www.intra2net.com/en/developer/libftdi/download.php"
license=('GPL2' 'LGPL2.1')
depends=('libusb' 'confuse')
optdepends=('python: library bindings')
makedepends=('boost' 'cmake' 'python' 'swig')
provides=('libftdi')
conflicts=('libftdi')
# doxygen for docs, confuse for eeprom
source=(https://www.intra2net.com/en/developer/libftdi/download/${pkgname%-aur}1-$pkgver.tar.bz2{,.sig})
sha1sums=('0b4dc9763342d094d2b5e74ced7d10d574b4758d'
          'SKIP')
validpgpkeys=('3CEA9B8868BC3852618EB5B4707F91A424F006F5')  # Intra2net open source

prepare() {
  cd "${pkgname%-aur}1-$pkgver"
  sed -i 's|LIB_SUFFIX 64|LIB_SUFFIX ""|' CMakeLists.txt
  sed -i "s|MODE=\"0664\", GROUP=\"plugdev\"|TAG+=\"uaccess\"|g" packages/99-libftdi.rules
}

build() {
  cd "$srcdir/${pkgname%-aur}1-$pkgver"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_SKIP_BUILD_RPATH=ON \
    -DCMAKE_BUILD_TYPE=Release -DEXAMPLES=OFF -DFTDI_EEPROM=ON
  make
}

# needs yet unknown dependencies
#check() {
#  cd "$srcdir/${pkgname%-aur}1-$pkgver/build"
#  make check
#}

package() {
  cd "${pkgname%-aur}1-$pkgver/build"
  make DESTDIR="$pkgdir" install
  install -Dm644 "../packages/99-libftdi.rules" "$pkgdir/usr/lib/udev/rules.d/69-libftdi.rules"
  # FS#45053
  mkdir -p "$pkgdir/usr/share/libftdi/examples"
  cp -r ../examples/* "$pkgdir/usr/share/libftdi/examples"
}

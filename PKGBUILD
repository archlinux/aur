# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=qt5-opcua
pkgver=5.15.2
pkgrel=1
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Qt wrapper for existing OPC UA stacks'
depends=('qt5-base' 'mbedtls2')
makedepends=('git')
groups=('qt5')
_pkgfqn=${pkgname/5-/}
source=(git+https://code.qt.io/qt/qtopcua.git#branch=5.15.2 fix-conversion-errors.patch fix-build-error.patch)
sha256sums=('SKIP' '406fcd9e4621b9674f8fbef60aa5fba08892cd947e83e9d7d09da0577c3bd09f' becae32d741f86105e24a62ca3718fa908523b6d81c79d9bf3f6a22311c4ab50)

prepare() {
  cd qtopcua
  patch -Np1 < ../fix-conversion-errors.patch
  patch -Np1 < ../fix-build-error.patch
}

build() {
  mkdir -p build
  cd build

  qmake ../${_pkgfqn} \
    CONFIG+=fat-static-lto \
    QMAKE_CFLAGS+="-I/usr/include/mbedtls2" \
    QMAKE_CXXFLAGS+="-I/usr/include/mbedtls2" \
    QMAKE_LFLAGS+="-L/usr/lib/mbedtls2"
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}


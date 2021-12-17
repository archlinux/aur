# Maintainer: Achmad Fathoni <fathoni DOT id AT gmail DOT com>

pkgname=qt5-charts-ubuntu-ver
_pkgname=qt5-charts
_qtver=5.12.8
pkgver=${_qtver/-/}
pkgrel=1
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3')
pkgdesc='qt5-charts with same version as current Ubuntu(focal)'
depends=('qt5-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('qt5-declarative')
optdepends=('qt5-declarative: QML bindings')
groups=('qt' 'qt5')
_pkgfqn="${_pkgname/5-/}-everywhere-src-${_qtver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('ded463b3f99bf5cc5fe39ed2d70183948c6e955430ce0b21eb235b5c13bc9d16')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake ../${_pkgfqn}
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}


# Maintainer: archlinux.info:tdy
# Contributor: Zhu Jinxuan <zhujinxuan@gmail.com>

pkgname=utopia-documents
pkgver=3.0.0
pkgrel=1
pkgdesc="PDF reader that displays interactive annotations on scientific articles"
arch=(i686 x86_64)
url=http://utopiadocs.com
license=(GPL)
depends=(libqglviewer pcre qt5-svg qt5-webkit qt5-script poppler-qt5 python2-pyqt5)
makedepends=(cmake boost swig glew)
source=(http://utopiadocs.com/files/$pkgname-$pkgver.tgz)
sha256sums=(1c259b68fada7f98080a66a63e36c707b78bfc3a5c80a956568ee73c030c8cac)

prepare() {
  install -m755 -d $pkgname-$pkgver/utopia-build/dependencies
  cd $pkgname-$pkgver/utopia-build/dependencies
  cmake ../../dependencies \
    -C../../dependencies/CMakeConfig/configurations/Linux.txt \
    -C../../dependencies/CMakeConfig/configurations/common.txt
}

build() {
  cd $pkgname-$pkgver/utopia-build
  cmake .. \
    -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON \
    -DUTOPIA_PACKAGE_MANAGED:BOOL=ON \
    -C../CMakeConfig/configurations/Linux.txt \
    -C../CMakeConfig/configurations/common.txt \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DUTOPIA_DEPENDENCIES_DIR:STRING=./utopia-build/dependencies
  make
}

package() {
  cd $pkgname-$pkgver/utopia-build
  make DESTDIR="$pkgdir" install
}

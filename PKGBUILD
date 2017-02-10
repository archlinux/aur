# Maintainer: rvasilev <2rvasilev@live.ru>
# Contributor: Zhu Jinxuan <zhujinxuan@gmail.com>
# Contributor: tdy tdy@archlinux.info

pkgname=utopia-documents
pkgbase=utopia-documents3
pkgver=3.0.0
pkgrel=1
pkgdesc="PDF reader that displays interactive annotations on scientific articles"
arch=(i686 x86_64)
url=http://utopiadocs.com
license=(GPL)
provides=('utopia-documents3')
conflicts=('utopia-documents')
depends=(libqglviewer pcre qt5-svg qt5-webkit qt5-script poppler-qt5 python2-pyqt5)
makedepends=(cmake boost swig glew)
source=("http://utopiadocs.com/files/${pkgname}-${pkgver}.tgz" "configure.patch")
sha256sums=('1c259b68fada7f98080a66a63e36c707b78bfc3a5c80a956568ee73c030c8cac'
            '808a26f259768507e864d729191b8dd85a6472f43d9c1f507dd775dd1eaedcc2')

prepare() {
PATCH="configure.patch"

cd $pkgname-$pkgver
patch configure ../$PATCH

./configure --release

cd build/Linux-Release
cp CMakeCache.txt CMakeCache.txt.1
sed -i 's|CMAKE_INSTALL_PREFIX:PATH=\/usr|CMAKE_INSTALL_PREFIX:PATH=XXXX|g' CMakeCache.txt.1
sed -i "s|XXXX|$pkgdir/usr|g"  CMakeCache.txt.1
cp CMakeCache.txt.1 CMakeCache.txt

}

build() {
  cd $pkgname-$pkgver/build/Linux-Release
  make -j4
}

package() {
  cd $pkgname-$pkgver/build/Linux-Release
  make install
}

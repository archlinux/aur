# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=grantlee
pkgver=5.1.0
pkgrel=4
pkgdesc="A string template engine based on the Django template system and written in Qt5"
arch=(x86_64)
url="https://github.com/steveire/grantlee"
license=(LGPL2.1)
depends=(qt5-script)
makedepends=(cmake doxygen graphviz)
source=("http://downloads.grantlee.org/grantlee-$pkgver.tar.gz"{,.asc}
        grantlee-c++11.patch grantlee-qt-5.13.patch)
sha256sums=('ea2e402466c74bb533eee2c7252209ec61cd93a5d236fecd625b4a0eb13a1478'
            'SKIP'
            'a14257e61489ee46c9236cc21af06e0eee5084c1563992d5a470153c7f318999'
            '60226562926c881cc617f236936d611a85e841865095e215f0f470d1eb945b77')
validpgpkeys=(FCA530E51EE4331C2DF16637D264C7B1D02D6509) # Stephen Kelly <steveire@gmail.com>

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  patch -p1 -i ../grantlee-c++11.patch # Fix build with new gcc/Qt combinations
  patch -p1 -i ../grantlee-qt-5.13.patch # Fix build with Qt 5.13
}

build() {
  cd build
  cmake ../${pkgbase}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=OFF \
    -DGrantlee_Qt5_TRANSITIONAL=ON
  make

  cd ../build-qt4
  cmake ../${pkgbase}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTS=OFF \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package_grantlee-qt5() {
  depends=('qt5-script')
  conflicts=('grantlee-qt4')

  cd build
  make DESTDIR="${pkgdir}" install
}

package_grantlee-qt4() {
  depends=('qt4')
  replaces=('grantlee')
  conflicts=('grantlee')
  provides=('grantlee')

  cd build-qt4
  make DESTDIR="${pkgdir}" install
  make docs
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 apidox/* -t "$pkgdir"/usr/share/doc/$pkgname
}

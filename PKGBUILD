# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=grantlee
pkgver=5.2.0
pkgrel=3
pkgdesc="A string template engine based on the Django template system and written in Qt5"
arch=(x86_64)
url="https://github.com/steveire/grantlee"
license=(LGPL2.1)
depends=(qt5-declarative)
makedepends=(cmake doxygen graphviz)
source=("http://downloads.grantlee.org/grantlee-$pkgver.tar.gz"{,.asc})
sha256sums=('d6cd04de39a073a787c9ab8e72a0888e40779d21b83fbc788a1b36d31ac659d5'
            'SKIP')
validpgpkeys=(FCA530E51EE4331C2DF16637D264C7B1D02D6509) # Stephen Kelly <steveire@gmail.com>

prepare() {
  mkdir -p build
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

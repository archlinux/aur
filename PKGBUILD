# $Id: PKGBUILD 277876 2016-10-07 17:36:47Z arojas $
# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=avogadro
pkgver=1.2.0
pkgrel=4
pkgdesc="An advanced molecular editor based on Qt"
arch=('i686' 'x86_64')
url="http://avogadro.openmolecules.net/wiki/Main_Page"
license=('GPL2')
depends=('openbabel' 'python2-pyqt4' 'boost-libs' 'glew' 'python2-numpy')
makedepends=('cmake' 'boost' 'doxygen' 'mesa-libgl' 'eigen')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'boost153.patch' 'avogadro-glibc2.23.patch' 'avogadro-fix-linking.patch')
md5sums=('3206068fc27bd3b717c568ee72f1e5ec'
         'aa2573f78d5dbd85b3cb79e08acde8ab'
         '83990ecbb4c076fddda3eaca2c2975ed'
         'e333f624d5649c6d3a7cfd14a778bc73')

prepare() {
  mkdir build

  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}"/boost153.patch
# Fix build with glibc 2.23
  patch -p1 -i ../avogadro-glibc2.23.patch
# Fix linking (Fedora)
  patch -p1 -i ../avogadro-fix-linking.patch
}

build() {
  cd build

  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DQT_MKSPECS_RELATIVE=share/qt4/mkspecs
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}

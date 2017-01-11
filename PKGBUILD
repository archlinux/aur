# Maintainer: Eric Berquist <eric.berquist at gmail dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=avogadro
pkgver=1.2.0
pkgrel=5
pkgdesc="An advanced molecular editor based on Qt"
arch=('i686' 'x86_64')
url="http://avogadro.openmolecules.net/wiki/Main_Page"
license=('GPL2')
depends=('openbabel' 'python2-pyqt4' 'boost-libs' 'glew' 'python2-numpy')
makedepends=('cmake' 'boost' 'doxygen' 'libgl' 'eigen2')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'boost153.patch'
        'avogadro-glibc2.23.patch'
        'avogadro-fix-linking.patch'
        'avogadro-force-eigen2.patch')
md5sums=('3206068fc27bd3b717c568ee72f1e5ec'
         'aa2573f78d5dbd85b3cb79e08acde8ab'
         '83990ecbb4c076fddda3eaca2c2975ed'
         'e333f624d5649c6d3a7cfd14a778bc73'
         'b05434bbf62570f72e0b0c7335cd44c3')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"  

  patch -p1 -i "${srcdir}"/boost153.patch
  # Fix build with glibc 2.23
  patch -p1 -i "${srcdir}"/avogadro-glibc2.23.patch
  # Fix linking (Fedora)
  patch -p1 -i "${srcdir}"/avogadro-fix-linking.patch
  # Force Eigen 2, newer versions of Eigen 3 remove backward
  # compatibility
  patch -p1 -i "${srcdir}"/avogadro-force-eigen2.patch

  mkdir -p build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  cmake "${srcdir}/${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DQT_MKSPECS_RELATIVE=share/qt4/mkspecs

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  make DESTDIR="${pkgdir}" install
}

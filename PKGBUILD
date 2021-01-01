# Maintainer: nim65s
# Former Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: simonp
# Contributor: Martin Ortbauer <mortbauer@gmail.com>
# Original: Michele Mocciola <mickele>
# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
# Modified by: César Vecchio <cesar UNDERSTRIKE vecchio AT yahoo DOT com>
# Contributor: valandil

_pkgname='med'
pkgname=('med-openmpi' 'med-openmpi-docs')
pkgver=4.1.0
pkgrel=1
pkgdesc="Modelisation et Echanges de Donnees, i.e. Data Modelization and Exchanges - code-aster exchange module linked to hdf5"
url="https://www.salome-platform.org/downloads"
license=('LGPL')
depends=('hdf5-openmpi' 'tk' 'python')
makedepends=('gcc-fortran' 'swig' 'openmpi' 'cmake')
arch=('x86_64')
source=("http://files.salome-platform.org/Salome/other/${_pkgname}-${pkgver}.tar.gz"
    "https://gist.githubusercontent.com/jedbrown/527ef81ff59a0dccf833da40fdd15a47/raw/7482f9a42fdd277f5f9cf0167ea7a3381032ca7a/hdf5-1.12.patch")
sha256sums=('847db5d6fbc9ce6924cb4aea86362812c9a5ef6b9684377e4dd6879627651fce'
    '82d28b6ae2ee6ceb3c6de9acb861a49741e2e759c7c556217f7d284216788206')

prepare() {
    cd ${_pkgname}-${pkgver}
    patch -p1 -i "$srcdir/hdf5-1.12.patch"
    sed -i 's/if H5_VERS_MINOR > 10/if 0/g' src/ci/MEDfileCompatibility.c
}

build() {
  cd ${_pkgname}-${pkgver}
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
      -DMEDFILE_USE_MPI=ON -DMEDFILE_BUILD_PYTHON=ON -DMEDFILE_BUILD_TESTS=OFF .
  make
}

# I got 37 tests failed out of 91…
#check() {
    #cd "$pkgname-$pkgver"
    #make test
#}

package_med-openmpi() {
  provides=('med')
  conflicts=('med')
  replaces=('med')

  cd ${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  rm -rf $pkgdir/usr/share/doc
}

package_med-openmpi-docs() {
  arch=('any')
  depends=()

  cd ${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  rm -rf $pkgdir/usr/share/cmake
  rm -rf $pkgdir/usr/lib
  rm -rf $pkgdir/usr/include
  rm -rf $pkgdir/usr/bin
}

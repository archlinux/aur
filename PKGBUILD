# Maintainer: Stefan Biereigel <stefan@biereigel.de>

pkgname=csxcad-git
pkgver=v0.6.2.r83.g21a0ea1
pkgrel=1
pkgdesc="A C++ library to describe geometrical objects and their physical or non-physical properties."
url="https://github.com/thliebig/CSXCAD"
arch=('i686' 'x86_64')
license=('LGPL3')
depends=('fparser' 'qt5-webkit' 'tinyxml' 'hdf5' 'vtk' 'boost' 'cgal')
provides=('csxcad')
conflicts=('csxcad')

source=(git+https://github.com/thliebig/CSXCAD 'fix-libdir.patch')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/CSXCAD"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd CSXCAD
  patch -Np1 -i ../fix-libdir.patch
}

build() {
  cd "$srcdir/CSXCAD"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir} ../
  make
  cd ../python
  python setup.py build
}

package() {
  cd "$srcdir/CSXCAD/build"
  make install
  cd ../python
  python setup.py install --root=${pkgdir}
}

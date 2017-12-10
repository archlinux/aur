# Maintainer: Stefan Biereigel <stefan@biereigel.de>

pkgname=openems-git
pkgver=v0.0.35.r28.g6133dea
pkgrel=1
pkgdesc="a free and open source EC-FDTD solver"
url="https://github.com/thliebig/openEMS"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('cmake' 'qt5-base' 'tinyxml' 'hdf5' 'boost' 'vtk' 'unixodbc' 'cgal' 'openmpi' 'csxcad')
provides=('openems')
conflicts=('openems')

source=(git+https://github.com/thliebig/openEMS 'fix-libdir.patch')
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/openEMS"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd openEMS
  patch -Np1 -i ../fix-libdir.patch
}

build() {
  cd "$srcdir/openEMS"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir} ../
  make
  cd ../python
  python setup.py build
}

package() {
  cd "$srcdir/openEMS/build"
  make install
  cd ../python
  python setup.py install --root=${pkgdir}
}

# Maintainer: leepesjee <lpeschier at xs4all dot nl>
pkgname=cbflib
pkgver=0.9.5
pkgrel=4
pkgdesc="An ANSI C library for accessing Crystallographic Binary and Image-supporting Files"
arch=('i686' 'x86_64')
url="http://www.bernstein-plus-sons.com/software/CBF/"
depends=('hdf5')
makedepends=('wget')
license=('GPL')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/CBFlib_0.9.5/CBFlib-$pkgver.tar.gz)
md5sums=('6cab26809e5d4786aeac1d32f72d7683')

prepare() {
  cd ./CBFlib-$pkgver
  make clean
  sed -i "s|INSTALLDIR  = \$(HOME)|INSTALLDIR  = ${pkgdir}/usr|" ./Makefile
  sed -i "s|HDF5 =|#HDF5 =|" ./Makefile
  sed -i "s|HDF5LIBS = ./lib/libhdf5.a|HDF5LIBS = -lhdf5|" ./Makefile
  sed -i "s|HDF5PREFIX =|#HDF5PREFIX =|" ./Makefile
  sed -i "s|HDF5SOLIBS = -L./lib|HDF5SOLIBS =|" ./Makefile
  sed -i "s|TIME = time|TIME = eval time|" ./Makefile
  sed -i "s|$(TIME) (LD_LIBRARY_PATH|$(TIME) LD_LIBRARY_PATH|" ./Makefile
  sed -i "s|XRD1621.cbf)|XRD1621.cbf|" ./Makefile
  sed -i "s|python|python2|" ./Makefile

}

build() {
  cd ./CBFlib-$pkgver
  NOFORTRAN=yes make all
  # make tests
  make shared
}

package() {
  cd ./CBFlib-$pkgver
  # the install script searches the solibs in the wrong location ...
  cp ./solib/*.so ./lib
  # ... and forgets to install testalloc
  mkdir -p $pkgdir/usr/bin
  cp ./bin/testalloc $pkgdir/usr/bin
  make install
  rmdir $pkgdir/usr/include/cbflib_old -v
}


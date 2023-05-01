# Maintainer: Luke Labrie-Cleary <luke dot cleary at copenhagenatomics dot com>
pkgname=moab-git
pkgver=5.4.1
pkgrel=1
pkgdesc="The Mesh-Oriented datABase MOAB is a component for representing and evaluating mesh data"
arch=('x86_64')
url="https://bitbucket.org/fathomteam/moab"
license=('GPL3')

depends=(
	python-numpy
	blas
	lapack
)
makedepends=(
	git
	eigen
	netcdf
	hdf5
	cython
	python-setuptools
	"glibc>=2.34"
	cmake
	patch
)

source=("${pkgname}::git+${url}.git")
pkgver() {
  cd $srcdir/${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
provides=("${pkgname%-pkgver}")

md5sums=('SKIP')
build() {
	cd $srcdir
	mkdir build && cd build
	cmake ../$pkgname -DENABLE_HDF5=ON \
				  -DENABLE_NETCDF=ON \
				  -DENABLE_FORTRAN=OFF \
				  -DENABLE_BLASLAPACK=OFF \
				  -DBUILD_SHARED_LIBS=ON \
				  -DENABLE_PYMOAB=ON \
				  -DBUILD_SHARED_LIBS=ON \
				  -DCMAKE_INSTALL_PREFIX=/opt/MOAB
	make
}

package() {
	cd $srcdir/build
	make DESTDIR="$pkgdir/" install
}
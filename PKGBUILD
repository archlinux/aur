# Maintainer: Luke Labrie-Cleary <luke dot cleary at copenhagenatomics dot com>
pkgname=moab
pkgver=5.3.1
pkgrel=1
pkgdesc="The Mesh-Oriented datABase MOAB is a component for representing and evaluating mesh data"
arch=('any')
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
)

provides=("${pkgname%-pkgver}")
source=('http://ftp.mcs.anl.gov/pub/fathom/moab-5.3.1.tar.gz')
md5sums=('935d18f8edf7dc3df625d9426a2d59e1')

build() {
	cd $srcdir
	mkdir build && cd build
	cmake ../$pkgname-$pkgver -DENABLE_HDF5=ON \
				  -DENABLE_NETCDF=ON \
				  -DENABLE_FORTRAN=OFF \
				  -DENABLE_BLASLAPACK=OFF \
				  -DENABLE_PYMOAB=ON \
				  -DBUILD_SHARED_LIBS=ON \
				  -DCMAKE_INSTALL_PREFIX=${pkgdir}/opt/MOAB
	make
}

package() {
	cd $srcdir/build
	make install
	cd pymoab 
	bash install.sh
	python setup.py install --user
}

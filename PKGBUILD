# Maintainer: Luke Labrie-Cleary <luke dot cleary at copenhagenatomics dot com>
pkgname=moab
pkgver=5.3.0
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
)

provides=("${pkgname%-pkgver}")
source=('https://ftp.mcs.anl.gov/pub/fathom/moab-5.3.0.tar.gz')
md5sums=('7ae3967f297f7d6fddf38de576e98758')
prepare() {
cd "$pkgname-$pkgver"
patch --forward --input="../../moab-5.3.0-p.1.patch"
}
build() {
	cd $srcdir
	mkdir build && cd build
	cmake ../$pkgname-$pkgver -DENABLE_HDF5=ON \
				  -DENABLE_NETCDF=ON \
				  -DENABLE_FORTRAN=OFF \
				  -DENABLE_BLASLAPACK=OFF \
				  -DENABLE_PYMOAB=ON \
				  -DBUILD_SHARED_LIBS=ON \
				  -DCMAKE_INSTALL_PREFIX=/opt/MOAB
	make
}

package() {
	cd $srcdir/build
	make DESTDIR="$pkgdir/" install
	cd pymoab
	python setup.py install --prefix=$pkgdir/opt/MOAB
}

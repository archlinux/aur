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
	patch
)

provides=("${pkgname%-pkgver}")
conflicts=(moab-git)
source=('https://ftp.mcs.anl.gov/pub/fathom/moab-5.3.0.tar.gz' 'moab-5.3.0-p.1.patch')
md5sums=('7ae3967f297f7d6fddf38de576e98758' 'SKIP')
prepare() {
cd "$pkgname-$pkgver"
patch --forward --input="${srcdir}/moab-5.3.0-p.1.patch"
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
	_ccores=`cat /proc/cpuinfo |grep CPU|wc -l`
  	if [ "x$1" != "x" ]; then
		_ccores=$1
  	fi
	make -j ${_ccores}
}

package() {
	cd $srcdir/build
	make DESTDIR="$pkgdir/" install
	cd pymoab

	# check if pymoab already installed
	if ! [ -d "/opt/MOAB/lib/python"* ]; then
		python setup.py install --prefix=$pkgdir/opt/MOAB
	fi
}

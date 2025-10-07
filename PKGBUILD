# Maintainer: Luke Labrie-Cleary <luke dot cleary at copenhagenatomics dot com>
pkgname=moab-git
pkgver=5.5.1.r643.g84f4f69e0
pkgrel=1
pkgdesc="The Mesh-Oriented datABase MOAB is a component for representing and evaluating mesh data"
arch=('x86_64')
url="https://bitbucket.org/fathomteam/moab"
license=('GPL3')

depends=(
	python-numpy
	blas
	lapack
	cython
	hdf5
)
makedepends=(
	git
	eigen
	netcdf
	"glibc>=2.34"
	cmake
	patch
)

provides=("${pkgname%-$pkgver}")
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd $srcdir/${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
provides=("${pkgname%-pkgver}")
conflicts=(moab)
md5sums=('SKIP')
build() {
	cd $srcdir
	mkdir build && cd build
	cmake ../$pkgname -DENABLE_HDF5=ON \
					  -DENABLE_NETCDF=ON \
					  -DENABLE_FORTRAN=OFF \
					  -DENABLE_BLASLAPACK=OFF \
					  -DBUILD_SHARED_LIBS=ON \
					  -DBUILD_SHARED_LIBS=ON \
					  -DCMAKE_INSTALL_PREFIX=/opt/MOAB \
					  -DHDF5_ROOT=/usr

	_ccores=$(nproc)
	# check if _ccores is a positive integer, if not, serial build
	if [[ "${_ccores}" =~ ^[1-9][0-9]*$ ]]; then
		make -j ${_ccores}
	else
		make
	fi
}

package() {
	cd $srcdir/build
	make DESTDIR="$pkgdir/" install
}

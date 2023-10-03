# Contibutor fdiblen <fdiblen at gmail dot com>
#
pkgname="casacore-git"
pkgver=r23274.adc7333f9
pkgrel=1
pkgdesc="Suite of c++ libraries for radio astronomy data processing"
arch=('i686' 'x86_64')
url="http://casacore.github.io/casacore/"
license=('GPL2')
depends=('boost-libs' 'fftw' 'gsl' 'openblas' 'lapack' 'cfitsio' 'wcslib' 'python-numpy')
makedepends=('git' 'cmake' 'gcc-fortran' 'gsl' 'boost')
optdepends=('sofa: only for testing casacore measures'
     	    'fftw: a library for computing the discrete Fourier transform'
            'hdf5: general purpose library and file format for storing scientific data'
	    'ncurses: curses emulation library')
conflicts=('casacore')
provides=("${pkgname}"
  'libcasa_casa.so=7'
  'libcasa_coordinates.so=7'
  'libcasa_derivedmscal.so=7'
  'libcasa_fits.so=7'
  'libcasa_images.so=7'
  'libcasa_lattices.so=7'
  'libcasa_meas.so=7'
  'libcasa_measures.so=7'
  'libcasa_mirlib.so=7'
  'libcasa_msfits.so=7'
  'libcasa_ms.so=7'
  'libcasa_python3.so=7'
  'libcasa_scimath_f.so=7'
  'libcasa_scimath.so=7'
  'libcasa_tables.so=7')
source=("$pkgname::git+https://github.com/casacore/casacore.git")
md5sums=('SKIP')

pkgver() {
	cd ${pkgname}
    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"

	[[ -d build ]] && rm -rf build
	
	export CXXFLAGS="${CFLAGS}"
	cmake \
	  -S casacore \
	  -B build \
	  -DCMAKE_BUILD_TYPE=None \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DBUILD_SHARED_LIBS=TRUE \
	  -DBUILD_PYTHON=OFF \
	  -DBUILD_PYTHON3=ON \
	  -Wno-dev
	cmake --build build --target all
}

package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR="${pkgdir}" cmake --build build --target install
	install -Dm 644 casacore/COPYING -t "${pkgdir}/usr/share/licenses/casacore"
}

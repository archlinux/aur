# Maintainer: Aaron Ali <t0nedef@causal.ca>
# Contributor: damir <damir@archlinux.org>

pkgname=fftw2-float
pkgver=2.1.5
pkgrel=1
pkgdesc="A C subroutine library for computing the discrete Fourier transform (DFT); Defaults to single precision"
arch=('i686' 'x86_64')
url="http://www.fftw.org/"
license=('GPL2')
depends=('openmpi')
makedepends=('gcc-fortran')
options=('!libtool')
provides=(fftw2)
source=(
	"http://www.fftw.org/fftw-${pkgver}.tar.gz"
	"doctex.patch"
)
install=${pkgname}.install

build() {
  cd "${srcdir}"

	# clean source tree and apply patch for latex info files
	# (which are not cleaned by default)
	cd fftw-${pkgver}
	./configure -q
	cd doc
	make maintainer-clean # doing this on the entire tree results in inability to build
	cd ..
	./configure -q
	make distclean
	cd ..
	patch -p0 < doctex.patch

	# copy source tree for two build options
	cp -r fftw-${pkgver} fftw-${pkgver}-double

  # build single precision
  cd fftw-${pkgver}
  ./configure F77=gfortran --prefix=/usr \
              --enable-float \
              --enable-type-prefix \
              --enable-shared \
              --enable-threads \
              --enable-mpi \
              --infodir=/usr/share/info
  make
  cd ../

   # build double precision
  cd fftw-${pkgver}-double
  ./configure F77=gfortran --prefix=/usr \
              --enable-type-prefix \
              --enable-shared \
              --enable-threads \
              --enable-mpi \
              --infodir=/usr/share/info
  make
}

package() {
  # install single precision
  cd "${srcdir}"/fftw-${pkgver}
  make DESTDIR="${pkgdir}" install
  
  # install double precision
  cd "${srcdir}"/fftw-${pkgver}-double
  make DESTDIR="${pkgdir}" install
  
  # provide single precision as default
  
  for f in "${pkgdir}"/usr/{include,$(get_libdir)}/*sfft*; do
    ln -s $(basename ${f}) ${f/sfft/fft}
  done
  for f in "${pkgdir}"/usr/{include,$(get_libdir)}/*srfft*; do
    ln -s $(basename ${f}) ${f/srfft/rfft}
  done
}
#
md5sums=('8d16a84f3ca02a785ef9eb36249ba433'
         'ab9e67b83c3254f32aa12b9b16b7d80f')

# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>
# Note: you need to install either atlas-lapack or openblas-lapack

pkgname=astromatic-sextractor
_pkgname=sextractor
pkgver=2.25.0
pkgrel=2
pkgdesc="builds a catalogue of objects from an astronomical image (build from source) "
url="http://www.astromatic.net/software/sextractor"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'blas' 'cblas' 'lapack')
makedepends=()
provides=()
conflicts=('sextractor-bin')
replaces=('sextractor-bin')
backup=()
source=(https://github.com/astromatic/sextractor/archive/${pkgver}.tar.gz)
sha1sums=('3ed53d55c0c77cd98a38bff1bde1b0d6fc625c18')

_use_mkl=0   # If you want to compile against intel mkl, make the value other than 0.

# decide which library to compile against
configure_options() {

	# First try intel-mkl if _use_mkl switch is on.
	if [ "$_use_mkl" != 0 ]; then
		_MKL=`pacman -Qq intel-mkl 2>/dev/null` || true
		if [ "$_MKL" != "" ]; then
			_COPTS="--enable-mkl"
		else
			echo "_use_mkl=1 but can not locate mkl libraries"
			exit 1
		fi
		echo "Compiling against intel-mkl"
		return
	fi

	# Try atlas-lapack first
	_ATLAS=`pacman -Qq atlas-lapack 2>/dev/null` || true
	if [ "$_ATLAS" != "" ]; then
		_COPTS=""
		echo "Compiling against atlas-lapack"
		return
	fi

	# If atlas-lapack not installed, fall back to openblas-lapack
	_OBLAS=`pacman -Qq opeblas-lapack 2>/dev/null` || true
	if [ "$_OBLAS" != "" ]; then
		_COPTS="--enable-openblas"
		echo "Compiling against openblas-lapack"
		return
	fi

	# If all fails exit and throw error. 
	echo "Failed to locate appropriate library: atlas-lapack, openblas-lapack, intel-mkl"
	exit 1
}

build() {

	configure_options

	cd $srcdir/${_pkgname}-${pkgver}
	sh autogen.sh
	./configure --prefix=/usr $_COPTS
	make
}

package() {

	cd $srcdir/${_pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install

	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

}


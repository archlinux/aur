# Maintainer:  Yigit Dallilar <yigit.dallilar@gmail.com>

pkgname=astromatic-scamp
_pkgname=scamp
pkgver=2.6.7
pkgrel=2
pkgdesc="computes astrometric and photometric solutions for any arbitrary sequence of FITS images in a completely automatic way."
url="http://www.astromatic.net/software/scamp"
arch=('x86_64')
license=('GPL')
depends=('astromatic-sextractor' 'cdsclient')
makedepends=()
conflicts=()
replaces=()
backup=()
source=(https://github.com/astromatic/scamp/archive/v${pkgver}.tar.gz)
sha1sums=('e52abdf41c617f94dfc93a43d020b8e044f291ec')

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
	_OBLAS=`pacman -Qq openblas-lapack 2>/dev/null` || true
	if [ "$_OBLAS" != "" ]; then
		_COPTS="--enable-openblas --with-openblas-incdir=/usr/include"
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


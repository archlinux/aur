# Mantainer: Alexandros Theodotou <alex at zrythm dot org>

_pkgbase=vamp-plugin-sdk
MINGW_PACKAGE_PREFIX=mingw-w64
pkgname=$MINGW_PACKAGE_PREFIX-$_pkgbase
pkgver=2.9.0
pkgrel=1
pkgdesc="Time-stretching and pitch-shifting audio library and utility"
arch=('any')
url="https://www.gnome.org"
license=("LGPL")
options=('!buildflags' '!strip' 'staticlibs')
makedepends=("${MINGW_PACKAGE_PREFIX}-meson")
depends=("${MINGW_PACKAGE_PREFIX}-libsndfile")
source=("https://code.soundsoftware.ac.uk/attachments/download/2588/vamp-plugin-sdk-${pkgver}.tar.gz"
01-mingw-shared.patch)
sha256sums=('b72a78ef8ff8a927dc2ed7e66ecf4c62d23268a5d74d02da25be2b8d00341099'
            '64201d3cf3ef1e2d56a6079eb3938b353983a5b2e8d63a41ab7419a71257f64a')
_architectures=('x86_64-w64-mingw32')

prepare() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	patch -Np1 -i ../01-mingw-shared.patch
}

build() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"

	CFLAGS+=" -D_USE_MATH_DEFINES -I${srcdir}/${_pkgbase}-${pkgver}"
	  CPPFLAGS+=" -D_USE_MATH_DEFINES -I${srcdir}/${_pkgbase}-${pkgver}"
	 for _arch in "${_architectures[@]}"; do
		 #mkdir -p build-${_arch} && pushd build-${_arch}
		./configure \
		  --host=x86_64-w64-mingw32 --target=x86_64-w64-mingw32 --build="$CHOST" \
		  --prefix=/usr/x86_64-w64-mingw32 --libdir=/usr/x86_64-w64-mingw32/lib --includedir=/usr/x86_64-w64-mingw32/include \
		  --enable-shared --enable-static 
		  sed -i -e 's/VAMP_PATH=/#/g' Makefile
		  sed -i -e '289s/cp/#/g' Makefile
		  sed -i -e '290s/cp/#/g' Makefile
		  make
		 # popd
	  done
}

package() {

	cd ${srcdir}/${_pkgbase}-${pkgver}
	for _arch in "${_architectures[@]}"; do
		pwd
      		DESTDIR="${pkgdir}" make install 
	done
}


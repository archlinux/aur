# Mantainer: Alexandros Theodotou <alex at zrythm dot org>

_pkgbase=vamp-plugin-sdk
MINGW_PACKAGE_PREFIX=mingw-w64
pkgname=$MINGW_PACKAGE_PREFIX-$_pkgbase
pkgver=2.10.0
pkgrel=1
pkgdesc="Time-stretching and pitch-shifting audio library and utility"
arch=('any')
url="https://www.gnome.org"
license=("LGPL")
options=('!buildflags' '!strip' 'staticlibs')
makedepends=("${MINGW_PACKAGE_PREFIX}-meson" "aria2")
depends=("${MINGW_PACKAGE_PREFIX}-libsndfile")
source=(#"https://code.soundsoftware.ac.uk/attachments/download/2588/vamp-plugin-sdk-${pkgver}.tar.gz"
01-mingw-shared.patch)
sha256sums=(#'b72a78ef8ff8a927dc2ed7e66ecf4c62d23268a5d74d02da25be2b8d00341099'
            'aa338dc97b454f800ed63d2e44f178f1d1e8fdaca16c19639e3773a968e5518c')
_architectures=('x86_64-w64-mingw32')

prepare() {
    # curl fails to download with certificate error
	cd "${srcdir}"
	aria2c --check-certificate=false \
	"https://code.soundsoftware.ac.uk/attachments/download/2691/${_pkgbase}-${pkgver}.tar.gz"
	tar -xf "${_pkgbase}-${pkgver}.tar.gz"

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


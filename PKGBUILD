# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libbs2b
_pkgname=libbs2b
pkgver=3.1.0
pkgrel=1
pkgdesc="Bauer stereophonic-to-binaural DSP effect library (mingw-w64)"
url="http://bs2b.sourceforge.net"
arch=('any')
license=('custom:MIT')
depends=('mingw-w64-libsndfile')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://downloads.sourceforge.net/sourceforge/bs2b/${_pkgname}-${pkgver}.tar.gz"
        "fix-dll-no-undefined.patch"
		"fix-format-security-error.patch")
md5sums=('2c3351f1785364107aabc44f67d33d84'
         '032add726f4355682a09b34fcb610328'
		 '6158826339a7082348195eaa0c205756')
sha1sums=('a71318211611a00bd3d595b0830d2188938ff89d'
          'a8f643592e2851e25dda19ecf33f39f5132668a1'
		  '8c6ea1d38789107cc9b1a71dd5eb24864ad50341')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/fix-dll-no-undefined.patch"
  patch -Np1 -i "${srcdir}/fix-format-security-error.patch"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgname}-$pkgver/"
  export ac_cv_func_malloc_0_nonnull=yes
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

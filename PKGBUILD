# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=mingw-w64-avisynthplus
pkgver=3.7.4
pkgrel=1
pkgdesc='An improved version of the AviSynth frameserver (mingw-w64)'
arch=('any')
url='https://avs-plus.net/'
license=('GPL-2.0-or-later')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs !debug)
#optdepends=(
#    'mingw-w64-devil: for ImageSeq plugin'
#    'mingw-w64-soundtouch: for TimeStretch plugin'
#)
makedepends=(
    'mingw-w64-gcc'
    'mingw-w64-cmake'
#    'mingw-w64-devil'
    'mingw-w64-soundtouch'
    'mingw-w64-wine'
)
source=("https://github.com/AviSynth/AviSynthPlus/archive/v${pkgver}/avisynthplus-${pkgver}.tar.gz"
        "mingw.patch"
        "staticlib.patch")
sha256sums=('c158cd7768bb9c589ae4588e6767b95831af79050bdd310d1681d23e6f736774'
            '692e6cf0b2abf1adcd8716b129022a059b61c9f9909d7032067abdfee81875a3'
            '0be77313c68329ccd2ec42828e2e5a8ad76822f9debb037d92b8a8145531eae6')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/AviSynthPlus-${pkgver}"

  patch -Np1 -i "${srcdir}/mingw.patch"
  patch -Np1 -i "${srcdir}/staticlib.patch"
}

build() {
  export LDFLAGS="$LDFLAGS -lssp"
  for _arch in ${_architectures}; do
   ${_arch}-cmake -B build-${_arch} -S "AviSynthPlus-${pkgver}" \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
	-DWITH_STATIC_LIB:BOOL='ON' \
	-DBUILD_SHIBATCH:BOOL='OFF' \
        -Wno-dev
    cmake --build build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}

    mv "$pkgdir"/usr/${_arch}/lib/avisynth/*.dll "$pkgdir"/usr/${_arch}/bin/
    mv "$pkgdir"/usr/${_arch}/lib/avisynth/*.a "$pkgdir"/usr/${_arch}/lib/
    rmdir "$pkgdir"/usr/${_arch}/lib/avisynth

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=mingw-w64-avisynthplus
pkgver=3.7.5
pkgrel=2
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
        '010-avisynthplus-fix-symbol-conflict-with-vmaf.patch'::'https://github.com/AviSynth/AviSynthPlus/commit/d1a32d5229602f181574c95fa0db68bcf1762606.patch'
        'avisynthplus.xml'
        'mingw.patch'
        'staticlib.patch')
sha256sums=('2533fafe5b5a8eb9f14d84d89541252a5efd0839ef62b8ae98f40b9f34b3f3d5'
            '30aeed221e21aef5aa1d99687bf49a5543602681e0f05bd857d3cf717343a6ee'
            'c4b270a3df7fbe1c153400215169c4ae4cae3b7a8710c843393e3a6ed0fd8a3e'
            '692e6cf0b2abf1adcd8716b129022a059b61c9f9909d7032067abdfee81875a3'
            '0be77313c68329ccd2ec42828e2e5a8ad76822f9debb037d92b8a8145531eae6')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/AviSynthPlus-${pkgver}"

  # https://gitlab.archlinux.org/archlinux/packaging/packages/ffmpeg/-/issues/19
  patch -Np1 -i "${srcdir}/010-avisynthplus-fix-symbol-conflict-with-vmaf.patch"
  patch -Np1 -i "${srcdir}/mingw.patch"
  patch -Np1 -i "${srcdir}/staticlib.patch"

  rm "avs_core/include/avisynth.h.orig" # included in the package if not removed
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
    install -D -m644 "${srcdir}/avisynthplus.xml" -t "${pkgdir}/usr/${_arch}/share/mime/packages"

    mv "$pkgdir"/usr/${_arch}/lib/avisynth/*.dll "$pkgdir"/usr/${_arch}/bin/
    mv "$pkgdir"/usr/${_arch}/lib/avisynth/*.a "$pkgdir"/usr/${_arch}/lib/
    rmdir "$pkgdir"/usr/${_arch}/lib/avisynth

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

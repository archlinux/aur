# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=mingw-w64-avisynthplus
pkgver=3.7.0
pkgrel=1
pkgdesc='An improved version of the AviSynth frameserver (mingw-w64)'
arch=('x86_64')
url='https://avs-plus.net/'
license=('GPL')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
#optdepends=('mingw-w64-devil: for ImageSeq plugin')
#makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-devil' 'mingw-w64-wine')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-wine')
source=("https://github.com/AviSynth/AviSynthPlus/archive/v${pkgver}/avisynthplus-${pkgver}.tar.gz"
        "mingw.patch"
        "staticlib.patch")
sha256sums=('8906d9e46dc90a194413d69b710e3106c0aafddc0c5c62004885d0c3beb79862'
            'eb5fd290367a4714707ff5c219c0fb6838378c838f7b76ce19ace64d2e1eb460'
            'a0838ef2cf66b89e8588703dfb1cd33c281dbc73a2d7af260668b958a3a5e304')
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
        -DCMAKE_BUILD_TYPE:STRING='None' \
	-DWITH_STATIC_LIB:BOOL='ON' \
	-DBUILD_SHIBATCH:BOOL='OFF' \
        -Wno-dev
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    make -C build-${_arch} DESTDIR="$pkgdir" install

    mv "$pkgdir"/usr/${_arch}/lib/avisynth/*.dll "$pkgdir"/usr/${_arch}/bin/
    mv "$pkgdir"/usr/${_arch}/lib/avisynth/*.a "$pkgdir"/usr/${_arch}/lib/
    rmdir "$pkgdir"/usr/${_arch}/lib/avisynth

    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

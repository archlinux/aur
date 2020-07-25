# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=mingw-w64-avisynthplus
pkgver=3.6.1
pkgrel=1
pkgdesc='An improved version of the AviSynth frameserver (mingw-w64)'
arch=('x86_64')
url='https://avs-plus.net/'
license=('GPL')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mingw-w64-wine')
source=("avisynthplus-${pkgver}.tar.gz"::"https://github.com/AviSynth/AviSynthPlus/archive/v${pkgver}.tar.gz"
	"mingw.patch"
	"staticlib.patch")
sha256sums=('a157648c0535013ec4895b8f03640d74ada43b93ac3d07b91087177f93278a30'
            'a354b983354c02e42bc7b95fe17dbad99104c74a3ee7e31255069f3919abbb62'
            'f2e83d6da6e6114455688d33287588889890c08a00fc85559c90c52213ba0535')
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

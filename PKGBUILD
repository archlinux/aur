# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mingw-w64-aom
pkgver=3.12.0
pkgrel=1
pkgdesc="Alliance for Open Media video codec (mingw-w64)"
url="https://aomedia.org/"
arch=('any')
license=(BSD-3-Clause)
depends=(
  mingw-w64-crt
)
options=(
  !strip
  !buildflags
  staticlibs
  !debug
)
makedepends=(
  mingw-w64-gcc
  mingw-w64-cmake
  ninja
  yasm
)
source=(
  https://storage.googleapis.com/aom-releases/libaom-$pkgver.tar.gz{,.asc}
  "cmake.patch"
)
b2sums=('fd38ccfcc7cb43099fad9842cc3bfb13d7e421bd9def4cc9660217d50a09f0b9e064b69b780791329971cce67518475d9760c3ccc1fa9052805b46c32ee9e225'
        'SKIP'
        '627c000cc5b152e78714898156ebebb2524749bd1d701bbbdca0b431301426c2f821403299a6fd4420be80133d4e7178dea8b2f4aae2ab34e9e81e584ebda345')
validpgpkeys=(
  B002F08B74A148DAA01F7123A48E86DB0B830498 # AOMedia release signing key <av1-discuss@aomedia.org>
)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libaom-$pkgver"

  patch -Np1 -i "${srcdir}"/cmake.patch
}

build() {

  # upstream wants this off
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=0}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=0}"

  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/libaom-$pkgver"/build-static-${_arch} && cd "${srcdir}/libaom-$pkgver"/build-static-${_arch}
    ${_arch}-cmake -G Ninja \
      -D CMAKE_BUILD_TYPE=Release \
      -D BUILD_SHARED_LIBS=0 \
      -D ENABLE_TESTS=0 \
      ..
    cmake --build .
  done

  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/libaom-$pkgver"/build-${_arch} && cd "${srcdir}/libaom-$pkgver"/build-${_arch}
    ${_arch}-cmake -G Ninja \
      -D CMAKE_BUILD_TYPE=Release \
      -D BUILD_SHARED_LIBS=1 \
      -D ENABLE_TESTS=0 \
      ..
    cmake --build .
  done
}

package() {
  cd "${srcdir}/libaom-$pkgver"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-static-${_arch}
    DESTDIR="$pkgdir" cmake --install build-${_arch}

    ${_arch}-strip -s "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 {LICENSE,PATENTS}
}

# vim:set sw=2 sts=-1 et:

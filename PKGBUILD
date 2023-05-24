# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mingw-w64-aom
pkgver=3.6.1
pkgrel=1
pkgdesc="Alliance for Open Media video codec (mingw-w64)"
url="https://aomedia.org/"
arch=('any')
license=(
  BSD
  custom:PATENTS
)
depends=(
  mingw-w64-crt
)
options=(
  !strip
  !buildflags
  staticlibs
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
b2sums=('c47b748e3dc43e39ecb55c4d61ea3d2d4a889bb8c6c399e29e14269757d271cd759a553f5da765bcdf7cd19546b408fce060d5ed3fb13e3aba4f8d22d612bf29'
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
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/libaom-$pkgver"/build-static-${_arch} && cd "${srcdir}/libaom-$pkgver"/build-static-${_arch}
    ${_arch}-cmake -G Ninja \
      -DBUILD_SHARED_LIBS=0 \
      -DENABLE_TESTS=0 \
      ..
    cmake --build .
  done

  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/libaom-$pkgver"/build-${_arch} && cd "${srcdir}/libaom-$pkgver"/build-${_arch}
    ${_arch}-cmake -G Ninja \
      -DBUILD_SHARED_LIBS=1 \
      -DENABLE_TESTS=0 \
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
}

# vim:set sw=2 sts=-1 et:

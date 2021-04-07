# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mingw-w64-aom
pkgver=3.0.0
pkgrel=1
pkgdesc="Alliance for Open Media video codec (mingw-w64)"
url="https://aomedia.org/"
arch=('any')
license=(BSD custom:PATENTS)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
makedepends=(mingw-w64-gcc mingw-w64-cmake git ninja yasm)
_commit=d853caa2ab62d161e5edf344ffee7b597449dc0d  # tags/v3.0.0^0
source=("git+https://aomedia.googlesource.com/aom#commit=$_commit"
        "cmake.patch")
b2sums=('SKIP'
        '627c000cc5b152e78714898156ebebb2524749bd1d701bbbdca0b431301426c2f821403299a6fd4420be80133d4e7178dea8b2f4aae2ab34e9e81e584ebda345')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd aom
  git describe --tags | sed 's/^v//;s/-errata/.errata/;s/-/+/g'
}

prepare() {
  cd aom
  patch -Np1 -i ${srcdir}/cmake.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/aom/build-static-${_arch} && cd "${srcdir}"/aom/build-static-${_arch}
    ${_arch}-cmake -S aom -G Ninja \
      -DBUILD_SHARED_LIBS=0 \
      -DENABLE_TESTS=0 \
      ..
    cmake --build .
  done

  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/aom/build-${_arch} && cd "${srcdir}"/aom/build-${_arch}
    ${_arch}-cmake -Haom -G Ninja \
      -DBUILD_SHARED_LIBS=1 \
      -DENABLE_TESTS=0 \
      ..
    cmake --build .
  done
}

package() {
  cd "${srcdir}"/aom
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-static-${_arch}
    DESTDIR="$pkgdir" cmake --install build-${_arch}

    mv "${pkgdir}"/usr/${_arch}/lib/*.dll "${pkgdir}"/usr/${_arch}/bin/

    ${_arch}-strip -s "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim:set et sw=2:

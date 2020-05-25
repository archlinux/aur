# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mingw-w64-aom
pkgver=2.0.0
pkgrel=1
pkgdesc="Alliance for Open Media video codec (mingw-w64)"
url="https://aomedia.org/"
arch=('any')
license=(BSD custom:PATENTS)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
makedepends=(mingw-w64-gcc mingw-w64-cmake git ninja yasm)
_commit=bb35ba9148543f22ba7d8642e4fbd29ae301f5dc  # tags/v2.0.0^0
source=("git+https://aomedia.googlesource.com/aom#commit=$_commit"
        "cmake.patch")
sha256sums=('SKIP'
            '0e32c089670732e8193050fd63b0677458cc86ed58ac42d5b73ea07f945632e0')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd aom
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd aom
  patch -Np1 -i ${srcdir}/cmake.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/aom/build-static-${_arch} && cd "${srcdir}"/aom/build-static-${_arch}
    ${_arch}-cmake -Haom -G Ninja \
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
    DESTDIR="$pkgdir" cmake --build build-static-${_arch} --target install
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install

    mv "${pkgdir}"/usr/${_arch}/lib/*.dll "${pkgdir}"/usr/${_arch}/bin/

    ${_arch}-strip -s "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

# vim:set et sw=2:

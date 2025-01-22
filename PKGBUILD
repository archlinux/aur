# Maintainer: Vaporeon <vaporeon@vaporeon.io>
pkgname=mingw-w64-sdl3
pkgver=3.2.0
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 3) (mingw-w64)"
url="http://libsdl.org"
arch=('any')
license=('Zlib')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'ninja')
options=('!debug' '!buildflags' '!strip' 'staticlibs')
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL3-${pkgver}.tar.gz")
b2sums=('a2c35eb9cf6f4344268e2595f1248cb3c6df95448ae6e4259ec69a7d3f286096d2f9bb49cdb031573d3b2854123156a98ca02bf03450b4e6a7c488d4b4f3612e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    BUILD_OPTS=("-DCMAKE_INSTALL_PREFIX=/usr/${_arch}"
      '-DCMAKE_BUILD_TYPE=None'
      '-DNDEBUG=ON')

    ${_arch}-cmake -S SDL3-${pkgver} -B build/${_arch}-static -G Ninja \
      -DBUILD_SHARED_LIBS=OFF \
      ${BUILD_OPTS[@]}

    ${_arch}-cmake -S SDL3-${pkgver} -B build/${_arch} -G Ninja \
      -DBUILD_SHARED_LIBS=ON \
      ${BUILD_OPTS[@]}

    cmake --build build/${_arch}-static
    cmake --build build/${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build/${_arch}-static
    DESTDIR="${pkgdir}" cmake --install build/${_arch}
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done

  install -Dm644 SDL3-${pkgver}/LICENSE.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Vaporeon <vaporeon@vaporeon.io>
pkgname=mingw-w64-sdl3
pkgver=3.2.16
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 3) (mingw-w64)"
url="http://libsdl.org"
arch=('any')
license=('Zlib')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'ninja')
options=('!debug' '!buildflags' '!strip' 'staticlibs')
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL3-${pkgver}.tar.gz")
b2sums=('b39912ca801dddb9c28143971658bf1fcfb92a4dbacb2ed0157d6615cfb9c61d8924880eb449f9ef59c0d917f2142cc430ba535272054e90af903a1f9e154e89')

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

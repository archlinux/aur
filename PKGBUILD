pkgname=mingw-w64-openal
pkgver=1.24.1
pkgrel=1
pkgdesc="Cross-platform 3D audio library, software implementation (mingw-w64)"
arch=(any)
url="https://github.com/kcat/openal-soft"
license=('LGPL-2.0-only')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'ninja')
options=('!debug' '!strip' '!buildflags' 'staticlibs')
source=("https://openal-soft.org/openal-releases/openal-soft-${pkgver}.tar.bz2")
sha256sums=('0b9883d2e372d4ce66d37b142ab10b606a8a0ed3e873d1e070b1c878b695425a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    BUILD_OPTS=("-DCMAKE_INSTALL_PREFIX=/usr/${_arch}"
      '-DCMAKE_BUILD_TYPE=Release'
      '-DALSOFT_EXAMPLES=OFF'
      '-DALSOFT_UTILS=OFF')

    ${_arch}-cmake -S openal-soft-${pkgver} -B build/${_arch}-static -G Ninja \
      -DBUILD_SHARED_LIBS=OFF \
      -DLIBTYPE=STATIC \
      ${BUILD_OPTS[@]}

    ${_arch}-cmake -S openal-soft-${pkgver} -B build/${_arch} -G Ninja \
      -DBUILD_SHARED_LIBS=ON \
      -DLIBTYPE=SHARED \
      ${BUILD_OPTS[@]}

    cmake --build build/${_arch}-static
    cmake --build build/${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build/${_arch}-static
    DESTDIR="${pkgdir}" cmake --install build/${_arch}
    rm -r "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}

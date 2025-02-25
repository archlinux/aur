# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Maintainer: seth <getchoo at tuta dot io>
# Contributor: xantares

pkgname=mingw-w64-zstd
_pkgname=zstd
pkgver=1.5.7
pkgrel=1
pkgdesc="Zstandard - Fast real-time compression algorithm (mingw-w64)"
url="https://facebook.github.io/zstd/"
arch=('x86_64')
license=('BSD-3-Clause OR GPL-2.0-or-later')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'ninja')
options=('staticlibs' '!buildflags' '!strip')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/facebook/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('37d7284556b20954e56e1ca85b80226768902e2edabd3b649e9e72c0c9012ee3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export CFLAGS+=' -ffat-lto-objects'
  export CXXFLAGS+=' -ffat-lto-objects'
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake -S ../build/cmake \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DZSTD_BUILD_CONTRIB=OFF \
      -DZSTD_BUILD_STATIC=OFF \
      -DZSTD_BUILD_TESTS=OFF \
      -DZSTD_PROGRAMS_LINK_SHARED=OFF \
      -DZSTD_BUILD_PROGRAMS=OFF \
      -GNinja
    cmake --build ./
    popd
  done
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
    DESTDIR="${pkgdir}" cmake --install ./
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    popd
  done
}

# -*- mode: Shell-script; eval: (setq tab-width 2) -*-
# Maintainer: Dominic <git at msrd0 dot de>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: xantares

pkgname=mingw-w64-zstd-static
_pkgname=zstd
pkgver=1.5.2
pkgrel=1
pkgdesc="Zstandard - Fast real-time compression algorithm (mingw-w64)"
url="http://www.zstd.net/"
arch=('x86_64')
license=('BSD' 'GPL2')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'ninja')
conflicts=('mingw-w64-zstd')
provides=("mingw-w64-zstd=$pkgver")
options=('staticlibs' '!buildflags' '!strip')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/facebook/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f7de13462f7a82c29ab865820149e778cbfe01087b3a55b5332707abf9db4a6e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export CFLAGS+=' -ffat-lto-objects'
  export CXXFLAGS+=' -ffat-lto-objects'
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake -S ../build/cmake -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DZSTD_BUILD_CONTRIB=OFF \
      -DZSTD_BUILD_SHARED=OFF \
      -DZSTD_BUILD_STATIC=ON \
      -DZSTD_BUILD_TESTS=OFF \
      -DZSTD_PROGRAMS_LINK_SHARED=OFF \
      -DZSTD_BUILD_PROGRAMS=OFF
    ninja
    popd
  done
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    popd
  done
}

# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=mingw-w64-libxlsxwriter-git
pkgver=1.1.3.r853.7f54faa
pkgrel=1
pkgdesc='A C library for creating Excel XLSX files (mingw-w64)'
arch=('any')
url='https://libxlsxwriter.github.io'
license=('BSD')
makedepends=('git' 'mingw-w64-cmake' 'mingw-w64-minizip')
options=('!strip' '!buildflags' 'staticlibs')
conflicts=('mingw-w64-libxlsxwriter')
provides=('mingw-w64-libxlsxwriter')
source=('git://github.com/jmcnamara/libxlsxwriter.git')
sha512sums=('SKIP')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

pkgver() {
  cd libxlsxwriter
  echo "$(grep -Po "LXW_VERSION\s*\"\K[^\"]+" include/xlsxwriter.h).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DUSE_SYSTEM_MINIZIP=ON \
      -DCMAKE_BUILD_TYPE=Release \
      ../libxlsxwriter
    make
    popd
  done
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DUSE_SYSTEM_MINIZIP=ON \
      -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      ../libxlsxwriter
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="${pkgdir}" VERBOSE=1 install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

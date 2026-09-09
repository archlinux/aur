pkgname=('mingw-w64-protobuf')
_pkgname=protobuf
pkgver=36.1
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format (mingw-w64)"
arch=('any')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=(mingw-w64-zlib mingw-w64-abseil-cpp)
makedepends=(mingw-w64-cmake protobuf)
options=(!strip !buildflags staticlibs)
source=("https://github.com/protocolbuffers/${_pkgname}/releases/download/v$pkgver/${_pkgname}-$pkgver.tar.gz")
sha256sums=('dc74fa582f559cbd31614ddfefb4868f43c919d7184bde514bb47f90c6025eb8')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_LOCAL_DEPENDENCIES_ONLY=ON -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/${_pkgname}-${pkgver}/build-${_arch}
    make DESTDIR="$pkgdir" install
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

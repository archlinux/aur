pkgname=('mingw-w64-protobuf')
_pkgname=protobuf
pkgver=25.3
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format (mingw-w64)"
arch=('any')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=(mingw-w64-zlib mingw-w64-abseil-cpp)
makedepends=(mingw-w64-cmake protobuf)
options=(!strip !buildflags staticlibs)
source=("https://github.com/protocolbuffers/${_pkgname}/releases/download/v$pkgver/${_pkgname}-$pkgver.tar.gz")
sha256sums=('d19643d265b978383352b3143f04c0641eea75a75235c111cc01a1350173180e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_ABSL_PROVIDER=package ..
    make
    popd
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

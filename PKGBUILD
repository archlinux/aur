pkgname=('mingw-w64-protobuf')
_pkgname=protobuf
pkgver=21.1
_pkgver=3.$pkgver
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format (mingw-w64)"
arch=('any')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=(mingw-w64-zlib)
makedepends=(mingw-w64-configure protobuf unzip)
options=(!strip !buildflags staticlibs)
source=("https://github.com/protocolbuffers/${_pkgname}/releases/download/v$pkgver/${_pkgname}-all-$pkgver.tar.gz")
sha256sums=('ad22f1624e237c0b3d362f78de7d96bf88b78d1fe19ae5dfa528a27306c7aaad')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/${_pkgname}-${_pkgver}
}

build() {
  cd ${srcdir}/${_pkgname}-${_pkgver}
  ./autogen.sh
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    LIBS="-lssp" ${_arch}-configure --with-protoc=/usr/bin/protoc ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/${_pkgname}-${_pkgver}/build-${_arch}
    make DESTDIR="$pkgdir" install
    rm "${pkgdir}"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

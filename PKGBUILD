# Maintainer: Benoit Favre <benoit.favre@gmail.com>

pkgname=('mingw-w64-protobuf')
_pkgname=protobuf
pkgver=3.2.0
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format (mingw-w64)"
arch=('any')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-zlib')
makedepends=('mingw-w64-gcc' 'protobuf')
options=(!strip !buildflags staticlibs)
source=("https://github.com/google/protobuf/releases/download/v${pkgver}/protobuf-cpp-${pkgver}.tar.gz")
md5sums=('46ab34b63ac77c02d4351961f6f85ded')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    for _arch in ${_architectures}; do
      mkdir -p build-${_arch} && pushd build-${_arch}
      ${_arch}-configure --with-protoc=/usr/bin/protoc ..
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

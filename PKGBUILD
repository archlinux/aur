# Maintainer: Benoit Favre <benoit.favre@gmail.com>

pkgname=('mingw-w64-protobuf')
_pkgname=protobuf
pkgver=2.6.1
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format"
arch=('any')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-zlib')
makedepends=('mingw-w64-gcc' 'protobuf')
options=(!strip !buildflags staticlibs)
source=(https://github.com/google/protobuf/releases/download/v$pkgver/protobuf-$pkgver.tar.bz2)
md5sums=('11aaac2d704eef8efd1867a807865d85')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    for _arch in ${_architectures}; do
        mkdir -p build-${_arch}
        pushd build-${_arch}
        ${_arch}-configure --with-protoc=/usr/bin/protoc
        make
        popd
    done
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    for _arch in ${_architectures}; do
        pushd build-${_arch}
        make DESTDIR="$pkgdir" install
        install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
        find ${pkgdir}/usr/${_arch} -name \*.a | xargs ${_arch}-strip -g
        find ${pkgdir}/usr/${_arch} -name \*.dll | xargs ${_arch}-strip --strip-unneeded
        rm -f ${pkgdir}/usr/${_arch}/bin/*.exe
        popd
    done
}


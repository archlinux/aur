# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libuv
_pkgname=libuv
pkgver=1.31.0
pkgrel=1
pkgdesc="Multi-platform support library with a focus on asynchronous I/O (mingw-w64)"
arch=('any')
url="https://github.com/libuv/libuv"
license=('custom')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/libuv/libuv/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('bb27ab86f2f6e9c2b22e768216097db2b69e468967b48bf1a15d17c36b445355ee4bd356f59bbd1bcf7d7c0d3f68b2c6660f999a2cc0660033eb5e3775499409')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

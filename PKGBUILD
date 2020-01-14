# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-libuv
_pkgname=libuv
pkgver=1.34.1
pkgrel=1
pkgdesc="Multi-platform support library with a focus on asynchronous I/O (mingw-w64)"
arch=('any')
url="https://github.com/libuv/libuv"
license=('custom')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/libuv/libuv/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('95212bdba326a22edb2663982a4abb95c420d287c67b20e57d6acdd4c40d40956ad28c599beaf10fbc941c6e50df94261d84abf8ac25abceb10f67d9de5ef3d3')

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

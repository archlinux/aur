# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Thomas Haider <t.haider@vcnc.org>

pkgname=mingw-w64-libev
_pkgname=libev
pkgver=4.25
pkgrel=1
pkgdesc="A full-featured and high-performance event loop (mingw-w64)"
arch=('any')
url="http://software.schmorp.de/pkg/libev.html"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
source=("http://dist.schmorp.de/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "libev-4.24-no-undefined.patch")
sha1sums=('f78a1338a0b975fb396b0b6558709211b6ccd794'
          '600ca8fe4c6503f592db7560301923f4ade5c224')
options=(!strip !buildflags staticlibs)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/libev-4.24-no-undefined.patch"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  export LIBS+=" -lws2_32"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    
    # fix conflict with mingw-w64-libevent
    rm ${pkgdir}/usr/${_arch}/include/event.h
    
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    rm -rf ${pkgdir}/usr/${_arch}/share
  done
}

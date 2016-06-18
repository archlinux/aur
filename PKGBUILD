# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Thomas Haider <t.haider@vcnc.org>

pkgname=mingw-w64-libev
_pkgname=libev
pkgver=4.22
pkgrel=1
pkgdesc="A full-featured and high-performance event loop (mingw-w64)"
arch=('any')
url="http://software.schmorp.de/pkg/libev.html"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure')
source=(http://dist.schmorp.de/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha1sums=('4affcba78dc17239f2ccd84d6e3e6dec2bd1f8ba')
options=(!strip !buildflags staticlibs)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$_pkgname-$pkgver"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  cd "$_pkgname-$pkgver"

  for _arch in ${_architectures}; do
    cd "${srcdir}/$_pkgname-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -rf ${pkgdir}/usr/${_arch}/share
  done
}


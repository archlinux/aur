# $Id$
# Maintainer: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ike Devolder <ike.devolder@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=taglib
_prefix=mingw-w64
pkgname=${_prefix}-${_pkgname}
pkgver=1.11.1
pkgrel=1
pkgdesc="A Library for reading and editing the meta-data of several popular audio formats"
arch=('x86_64')
url="https://taglib.github.io/"
license=(LGPL MPL)
depends=("${_prefix}-zlib" "${_prefix}-crt" "${_prefix}-cppunit")
makedepends=("${_prefix}-cmake" "${_prefix}-boost")
options=(staticlibs !buildflags !strip)
source=("https://taglib.github.io/releases/$_pkgname-$pkgver.tar.gz"
        taglib-ogg-corruption.patch::"https://github.com/taglib/taglib/commit/9336c82d.patch"
        fix-finding-cppunit.patch::"https://raw.githubusercontent.com/msys2/MINGW-packages/master/mingw-w64-taglib/fix-finding-cppunit.patch")
sha256sums=('b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b'
            'bf15f9d99263ca9e3cd96ee16dbfe38ca02932a0e8e2d77696d7188679bda272'
            '460e2dd83e6233145e4980a4c63a400e9e8297980e3cfae910dadefa2475e7d0')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  mkdir -p build

  cd $_pkgname-$pkgver
  patch -p1 -i ../taglib-ogg-corruption.patch # Fix occasional OGG file corruption
  patch -p1 -i ../fix-finding-cppunit.patch
}

build() {
  cd "${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ../ \
         -DBUILD_SHARED_LIBS=ON \
         -DWITH_MP4=ON \
         -DWITH_ASF=ON
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
 done
}

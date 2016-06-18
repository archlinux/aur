# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=mingw-w64-libsodium
_pkgname=libsodium
pkgver=1.0.10
pkgrel=1
pkgdesc="P(ortable|ackageable) NaCl-based crypto library (mingw-w64)"
arch=('any')
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure')
source=("http://download.dnscrypt.org/$_pkgname/releases/$_pkgname-${pkgver}.tar.gz")
sha512sums=('ff52e7f25787cc858e8d26be10913c689bd3dd394c8e163133920141be67a292a1dba066a1037e83cf0ced155a1554f07f24c2f33a7a6aa52521d39f537cd515')
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
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:

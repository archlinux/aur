# $Id$
# Maintainer: Zachary Emmert <zack.emmert@gmail.com>
# Contributor: eimis <eimantas@remote.solutions>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: namelessjon <jonathan.stott@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>

pkgname=mingw-w64-libsodium
_pkgname=libsodium
pkgver=1.0.16
pkgrel=1
pkgdesc="P(ortable|ackageable) NaCl-based crypto library (mingw-w64)"
arch=('any')
url="https://github.com/jedisct1/libsodium"
license=('custom:ISC')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure')
source=("https://github.com/jedisct1/$_pkgname/releases/download/${pkgver}/$_pkgname-${pkgver}.tar.gz")
sha512sums=('SKIP')
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

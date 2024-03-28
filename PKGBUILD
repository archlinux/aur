# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Orivej Desh <smpuj@bk.ru>

pkgname=mingw-w64-libunibreak
_pkgname=libunibreak
pkgver=6.1
pkgrel=1
pkgdesc="An implementation of the line breaking algorithm as described in Unicode 5.2.0 Standard Annex 14, Revision 24 (mingw-w64)"
arch=('i686' 'x86_64')
url="https://github.com/adah1972/libunibreak/"
license=("custom:zlib/libpng")
depends=('mingw-w64-crt')
options=(!strip !buildflags !libtool staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'mingw-w64-configure')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/adah1972/libunibreak/archive/libunibreak_${pkgver//./_}.tar.gz")
sha256sums=('890674996168ef5ba143d80d49ab8b61594a4eb70198dcac76caf6e1bd264a41')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/libunibreak-libunibreak_${pkgver//./_}"
  ./bootstrap

  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/libunibreak-libunibreak_${pkgver//./_}/build-${_arch} && cd ${srcdir}/libunibreak-libunibreak_${pkgver//./_}/build-${_arch}
    ${_arch}-configure
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/libunibreak-libunibreak_${pkgver//./_}/build-${_arch}
    make DESTDIR="$pkgdir" install

    cd ${srcdir}/libunibreak-libunibreak_${pkgver//./_}
    install -Dm644 LICENCE "$pkgdir/usr/${_arch}/share/licenses/$pkgname/LICENSE"
  done
}

# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: xantares <xantares09@hotmail.com>

pkgname=mingw-w64-libmpc
pkgver=1.1.0
pkgrel=2
pkgdesc="Library for the arithmetic of complex numbers with arbitrarily high precision (mingw-w64)"
arch=(any)
url="http://www.multiprecision.org/mpc/"
license=("LGPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-mpfr)
options=(!libtool !strip !buildflags)
source=(https://ftp.gnu.org/gnu/mpc/mpc-${pkgver}.tar.gz{,.sig})
sha256sums=('6985c538143c1208dcb1ac42cedad6ff52e267b47e5f970183a3e75125b43c2e'
            'SKIP')
validpgpkeys=('AD17A21EF8AED8F1CC02DBD9F7D5C9BF765C61E3')  # Andreas Enge

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd mpc-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    $_arch-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/mpc-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

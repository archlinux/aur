# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=mingw-w64-gsl
pkgver=2.8
pkgrel=1
pkgdesc="The GNU Scientific Library (GSL) is a modern numerical library for C and C++ programmers (mingw-w64)"
arch=(any)
url="http://www.gnu.org/software/gsl/gsl.html"
license=("GPL-3.0-only")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=("http://ftp.gnu.org/gnu/gsl/gsl-$pkgver.tar.gz")
sha256sums=('6a99eeed15632c6354895b1dd542ed5a855c0f15d9ad1326c6fe2b2c9e423190')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/gsl-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gsl-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}

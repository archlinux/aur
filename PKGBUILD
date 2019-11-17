pkgname=mingw-w64-zfp
pkgver=0.5.5
pkgrel=1
pkgdesc="Library for compressed numerical array (mingw-w64)"
arch=('any')
url="https://computation.llnl.gov/projects/floating-point-compression"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/LLNL/zfp/releases/download/$pkgver/zfp-$pkgver.tar.gz")
sha256sums=('fdf7b948bab1f4e5dccfe2c2048fd98c24e417ad8fb8a51ed3463d04147393c5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
  cd "$srcdir/zfp-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/zfp-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


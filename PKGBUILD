pkgname=mingw-w64-coin-or-ipopt
pkgver=3.12.13
pkgrel=1
pkgdesc="Interior Point OPTimizer (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Ipopt"
license=('EPL')
groups=('mingw-w64-coin-or')
depends=('mingw-w64-lapack')
makedepends=('mingw-w64-configure' 'wget')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/Ipopt/Ipopt-$pkgver.tgz")
sha256sums=('aac9bb4d8a257fdfacc54ff3f1cbfdf6e2d61fb0cf395749e3b0c0664d3e7e96')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/Ipopt-$pkgver"
  pushd ThirdParty/ASL && ./get.ASL && popd
  pushd ThirdParty/Metis && ./get.Metis && popd
  pushd ThirdParty/Mumps && ./get.Mumps && popd
}

build() {
  cd "$srcdir/Ipopt-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-blas-incdir=/usr/${_arch}/include --with-blas-lib="-lblas" \
      --with-lapack-incdir=/usr/${_arch}/include --with-lapack-lib="-llapack" \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Ipopt-$pkgver/build-${_arch}
    PKG_CONFIG_PATH_CUSTOM="$pkgdir"/usr/${_arch}/lib/pkgconfig/ \
    make DESTDIR="$pkgdir"/ install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


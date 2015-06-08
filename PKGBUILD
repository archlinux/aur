pkgname=mingw-w64-coin-or-ipopt
pkgver=3.12.3
pkgrel=1
pkgdesc="Interior Point OPTimizer (mingw-w64)"
arch=('any')
url="https://projects.coin-or.org/Ipopt"
license=('EPL')
groups=('coin-or')
depends=('mingw-w64-lapack')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.coin-or.org/download/source/Ipopt/Ipopt-$pkgver.tgz")
sha1sums=('6a2aa349117b5362a8f2da43c865aac83e89551b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/Ipopt-$pkgver"
  #sed -i "s|libipopt_la_LIBADD = \$(IPALLLIBS)|libipopt_la_LIBADD = \$(IPALLLIBS) -lapack|g" src/Interfaces/Makefile.in
  #sed -i "s|libipopt_la_LDFLAGS = \$(LT_LDFLAGS)|libipopt_la_LDFLAGS = \$(libdir)/liblapack.dll.a \$(libdir)/libblas.dll.a -no-undefined \$(LT_LDFLAGS)|g" src/Interfaces/Makefile.in
  #sed -i "s|liblinalg_la_LIBADD =|liblinalg_la_LIBADD = \$(libdir)/liblapack.dll.a \$(libdir)/libblas.dll.a|g" src/LinAlg/Makefile.in
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --libdir=/usr/${_arch}/lib
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
    #${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


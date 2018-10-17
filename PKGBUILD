
pkgname=mingw-w64-lrs
_pkgver=062
_date=2017-03-03
pkgver=$_pkgver+${_date//-/.}
_upstreamver=${_pkgver}+autotools-$_date
pkgrel=1
pkgdesc="C implementation of the reverse search algorithm for vertex enumeration/convex hull problems (mingw-w64)"
arch=('any')
url="http://cgm.cs.mcgill.ca/~avis/C/lrs.html"
license=('GPL')
depends=('mingw-w64-gmp')
makedepends=('mingw-w64-gcc')
options=('!buildflags' 'staticlibs' '!strip')
source=(https://github.com/mkoeppe/lrslib/releases/download/lrslib-$_upstreamver/lrslib-${_upstreamver/+/.}.tar.gz)
sha256sums=('03b80a94ac4d673d588cac2561b02f6217d5a9f056e09ed59916a337974524f8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd lrslib-$_upstreamver
  # undefined symbols for dll
  sed -i "s|liblrsgmp_la_LDFLAGS =|liblrsgmp_la_LDFLAGS = -no-undefined|g" Makefile.am
  # disable exes
  sed -i "s|bin_PROGRAMS|#bin_PROGRAMS|g" Makefile.am
  autoreconf -i
}

build() {
  cd lrslib-$_upstreamver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-mplrs ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/lrslib-$_upstreamver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


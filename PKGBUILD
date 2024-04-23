pkgname=mingw-w64-hwloc
pkgver=2.10.0
pkgrel=1
pkgdesc='Portable Hardware Locality is a portable abstraction of hierarchical architectures (mingw-w64)'
url='https://www.open-mpi.org/projects/hwloc/'
arch=('any')
license=('BSD')
depends=('mingw-w64-libxml2')
makedepends=('mingw-w64-configure')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://www.open-mpi.org/software/hwloc/v${pkgver%.*}/downloads/hwloc-${pkgver}.tar.bz2")
sha256sums=('0305dd60c9de2fbe6519fe2a4e8fdc6d3db8de574a0ca7812b92e80c05ae1392')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

#prepare() {
#  cd hwloc-${pkgver}
#  sed -i "161,163d" utils/hwloc/Makefile.am
#  autoreconf -fiv
#}

build() {
  cd hwloc-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  cd hwloc-${pkgver}
  for _arch in ${_architectures}; do
    cd "$srcdir/hwloc-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/*.txt
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

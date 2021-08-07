pkgname=mingw-w64-librttopo
pkgver=1.1.0
pkgrel=1
pkgdesc="RT Topology Library (mingw-w64)"
arch=('any')
url="https://git.osgeo.org/gitea/rttopo/librttopo"
license=('GPL2')
depends=('mingw-w64-geos')
makedepends=('mingw-w64-configure')
options=('!buildflags' 'staticlibs' '!strip')
source=(https://git.osgeo.org/gitea/rttopo/librttopo/archive/librttopo-$pkgver.tar.gz)
sha256sums=('2e2fcabb48193a712a6c76ac9a9be2a53f82e32f91a2bc834d9f1b4fa9cd879f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"/librttopo
  ./autogen.sh
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --with-geosconfig=/usr/${_arch}/bin/geos-config ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/librttopo/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


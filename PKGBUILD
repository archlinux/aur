pkgname=mingw-w64-proj
pkgver=4.9.2
pkgrel=1
arch=('any')
pkgdesc="Cartographic Projections library. (mingw-w64)"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
license=('BSD')
url="http://trac.osgeo.org/proj/"
source=("https://github.com/OSGeo/proj.4/archive/${pkgver}.tar.gz")
sha256sums=('9a40de36183d23a395cf51ba7a465e1e6c982b6e4553b31310c42012d188be6b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}"/proj.4-${pkgver}
  sed -i "76,80d" src/Makefile.am
  sed -i "s|src man nad jniwrap cmake|src man jniwrap cmake|g" Makefile.am
  autoreconf -vfi
}

build()
{
  cd "${srcdir}"/proj.4-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/proj.4-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir/" install
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir/usr/${_arch}"/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

pkgname=mingw-w64-libmixmod
pkgver=2.1.10
pkgrel=1
pkgdesc="Classification with Mixture Modelling"
arch=('any')
url="https://github.com/mixmod"
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/mixmod/mixmod/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e0bc339f36ec22080a8a270ea87976f7b277ce4e3e9e383fba51548f83aa4d0b')

_architecture="i686-w64-mingw32 x86_64-w64-mingw32"

build () {
  cd "$srcdir"/mixmod-${pkgver}
  for _arch in $_architecture; do
    ${_arch}-cmake -B build-${_arch} -DCMAKE_UNITY_BUILD=ON .
    make -C build-${_arch}
  done
}

package () {
  cd "$srcdir"/mixmod-${pkgver}
  for _arch in $_architecture; do
    make install -C build-${_arch} DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share 
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


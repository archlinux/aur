pkgname=mingw-w64-libmixmod
pkgver=2.1.11
pkgrel=1
pkgdesc="Classification with Mixture Modelling"
arch=('any')
url="https://github.com/mixmod"
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/mixmod/mixmod/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e95414decf5b2c2c5eebd7fca10e0100f2d753cbfca0694f4ac75da3b39b005e')

_architecture="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir"/mixmod-${pkgver}
  # eigen 5.x compat
  curl -L https://github.com/mixmod/mixmod/pull/36.patch | patch -p1
}

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


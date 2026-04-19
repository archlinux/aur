pkgname=mingw-w64-glew
pkgver=2.3.1
pkgrel=1
pkgdesc="The OpenGL Extension Wrangler Library (mingw-w64)"
arch=('any')
url="http://glew.sourceforge.net/"
license=('Modified BSD/MIT/GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/nigels-com/glew/releases/download/glew-${pkgver}/glew-${pkgver}.tgz")
sha256sums=('b64790f94b926acd7e8f84c5d6000a86cb43967bd1e688b03089079799c9e889')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd ${srcdir}/glew-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DBUILD_UTILS=OFF -B build-${_arch} build/cmake/
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/glew-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    install -m 644 lib/libglew32.a "$pkgdir"/usr/${_arch}/lib/
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


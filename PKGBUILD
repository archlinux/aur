pkgname=mingw-w64-glew
pkgver=2.1.0
pkgrel=4
pkgdesc="GLEW, The OpenGL Extension Wrangler Library (mingw-w64)"
arch=('any')
url="http://glew.sourceforge.net/"
license=('Modified BSD/MIT/GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/nigels-com/glew/releases/download/glew-${pkgver}/glew-${pkgver}.tgz")
sha256sums=('04de91e7e6763039bc11940095cd9c7f880baba82196a7765f727ac05a993c95')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd ${srcdir}/glew-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ../build/cmake/
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/glew-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


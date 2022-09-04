pkgname=mingw-w64-glew
pkgver=2.2.0
pkgrel=2
pkgdesc="The OpenGL Extension Wrangler Library (mingw-w64)"
arch=('any')
url="http://glew.sourceforge.net/"
license=('Modified BSD/MIT/GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/nigels-com/glew/releases/download/glew-${pkgver}/glew-${pkgver}.tgz")
sha256sums=('d4fc82893cfb00109578d0a1a2337fb8ca335b3ceccf97b97e5cc7f08e4353e1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd ${srcdir}/glew-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_UTILS=OFF ../build/cmake/
    make
    popd
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


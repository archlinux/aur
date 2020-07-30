
pkgname=mingw-w64-gl2ps
pkgver=1.4.2
pkgrel=1
pkgdesc="an OpenGL to PostScript printing library (mingw-w64)"
arch=('any')
url='http://geuz.org/gl2ps/'
license=('LGPL')
depends=('mingw-w64-libpng' 'mingw-w64-freeglut')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://geuz.org/gl2ps/src/gl2ps-${pkgver}.tgz")
sha256sums=('8d1c00c1018f96b4b97655482e57dcb0ce42ae2f1d349cd6d4191e7848d9ffe9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/gl2ps-${pkgver}"
}

build() {
  cd "${srcdir}/gl2ps-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DPDFLATEX_COMPILER=0 \
      -DGLUT_glut_LIBRARY_RELEASE=/usr/${_arch}/lib/libfreeglut.dll.a \
       ..
    make
    popd
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir"/gl2ps-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/{gl2ps*,README.txt,COPYING*}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


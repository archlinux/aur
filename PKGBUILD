
pkgname=mingw-w64-gl2ps
pkgver=1.4.0
pkgrel=1
pkgdesc="an OpenGL to PostScript printing library (mingw-w64)"
arch=('any')
url='http://geuz.org/gl2ps/'
license=('LGPL')
depends=('mingw-w64-libpng' 'mingw-w64-freeglut')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://geuz.org/gl2ps/src/gl2ps-${pkgver}.tgz")
sha256sums=('03cb5e6dfcd87183f3b9ba3b22f04cd155096af81e52988cc37d8d8efe6cf1e2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/gl2ps-${pkgver}-source"
}

build() {
  cd "${srcdir}/gl2ps-${pkgver}-source"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DPDFLATEX_COMPILER=0 \
      -DGLUT_glut_LIBRARY_RELEASE=/usr/${_arch}/lib/libfreeglut.dll.a \
      -DGLUT_LIBRARIES=/usr/${_arch}/lib/libfreeglut.dll.a ..
    make
    popd
  done
}

package() {
  for _arch in $_architectures; do
    cd "$srcdir"/gl2ps-${pkgver}-source/build-${_arch}
    make install DESTDIR="$pkgdir"
    install -d "$pkgdir"/usr/${_arch}/bin
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin/
    rm "$pkgdir"/usr/${_arch}/{gl2ps*,README.txt,COPYING*}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


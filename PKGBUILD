
pkgname=mingw-w64-gl2ps
pkgver=1.4.3
pkgrel=1
pkgdesc="an OpenGL to PostScript printing library (mingw-w64)"
arch=('any')
url='http://geuz.org/gl2ps/'
license=('LGPL')
depends=('mingw-w64-libpng' 'mingw-w64-freeglut')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://geuz.org/gl2ps/src/gl2ps-${pkgver}.tgz")
sha256sums=('2e0a5368917cf0e5467ba8618bc576f50ae9f316c61201635b09711c7908efcc')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

prepare() {
  cd "${srcdir}/gl2ps-${pkgver}"
}

build() {
  cd "${srcdir}/gl2ps-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DPDFLATEX_COMPILER=0 \
      -DZGLUT_glut_LIBRARY_RELEASE=/usr/${_arch}/lib/libfreeglut.dll.a \
       -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "${srcdir}/gl2ps-${pkgver}"
  for _arch in $_architectures; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


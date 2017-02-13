
pkgname=mingw-gl2ps
pkgver=1.3.9
pkgrel=1
pkgdesc="an OpenGL to PostScript printing library (mingw-w64)"
arch=('any')
url='http://geuz.org/gl2ps/'
license=('LGPL')
depends=('mingw-w64-libpng')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://geuz.org/gl2ps/src/gl2ps-${pkgver}.tgz")
sha512sums=('e6770c27d4832a300b4e16a9f98deb8557e7875460e7aa7e655fdb796f5dfffd5eccdc8b15f5a3ae151713fc46f97dacad48ee7550c41373b6fc8cfd21a437cb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gl2ps-${pkgver}-source"
  sed -i "/gl2psTest/d" CMakeLists.txt
}

build() {
  cd "${srcdir}/gl2ps-${pkgver}-source"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DGLUT_glut_LIBRARY=/usr/${_arch}/lib/libfreeglut.dll.a \
    -DGLUT_LIBRARIES=/usr/${_arch}/lib/libfreeglut.dll.a \
    ..
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
    rm "$pkgdir"/usr/${_arch}/gl2ps*
    rm "$pkgdir"/usr/${_arch}/README.txt
    rm "$pkgdir"/usr/${_arch}/COPYING*
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


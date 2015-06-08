
pkgname=mingw-w64-cminpack
pkgver=1.3.4
pkgrel=1
pkgdesc="A C/C++ rewrite of the MINPACK software (mingw-w64)"
arch=('any')
url='http://devernay.free.fr/hacks/cminpack/cminpack.html'
license=('GPL' 'LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://devernay.free.fr/hacks/cminpack/cminpack-${pkgver}.tar.gz")
md5sums=('5d95527644f3eb924fea9aff55e0ebfb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd $srcdir/cminpack-${pkgver}
  sed -i "s|RUNTIME DESTINATION \${CMINPACK_LIB_INSTALL_DIR}|RUNTIME DESTINATION  bin|g" CMakeLists.txt
}

build() {
  cd $srcdir/cminpack-${pkgver}
   for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMINPACK_LIB_INSTALL_DIR=lib \
     -DBUILD_EXAMPLES=OFF ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMINPACK_LIB_INSTALL_DIR=lib \
    -DSHARED_LIBS=ON -DBUILD_EXAMPLES=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/cminpack-${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/cminpack-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

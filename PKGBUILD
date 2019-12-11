pkgname=mingw-w64-libbatch
pkgver=2.4.2
pkgrel=1
pkgdesc="Generic platform for Pre and Post-Processing for numerical simulation - libBatch library"
url="http://www.salome-platform.org"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
arch=('any')
license=('LGPL')
source=("libbatch-${pkgver}::git+git://git.salome-platform.org/tools/libbatch.git#tag=V${pkgver//./_}")
sha256sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/libbatch-${pkgver}"
  sed -i "s|ADD_DEFINITIONS(/wd4251|#|g" src/CMakeLists.txt
  sed -i "s|Windows.h|windows.h|g" src/Local/BatchManager_Local.hxx src/Core/Utils.cxx
}

build() {
  cd "$srcdir/libbatch-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DLIBBATCH_PYTHON_WRAPPING=OFF \
      -DPTHREAD_LIBRARY=/usr/${_arch}/lib/libwinpthread.dll.a \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libbatch-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    install -d "$pkgdir"/usr/${_arch}/bin
    mv "$pkgdir"/usr/${_arch}/lib/*.dll "$pkgdir"/usr/${_arch}/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

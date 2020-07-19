pkgname=mingw-w64-libgdiplus
pkgver=6.0.5
pkgrel=1
pkgdesc="An Open Source Implementation of the GDI+ API (mingw-w64)"
arch=('any')
license=('MPL' 'LGPL')
url="https://www.mono-project.com/"
depends=(mingw-w64-libtiff
         mingw-w64-cairo
         mingw-w64-fontconfig
         mingw-w64-freetype
         mingw-w64-giflib
         mingw-w64-glib2
         mingw-w64-libexif
         mingw-w64-libpng
         mingw-w64-zlib)
makedepends=(mingw-w64-configure)
options=(!strip !buildflags staticlibs)
source=("https://github.com/mono/libgdiplus/archive/${pkgver}.tar.gz")
sha256sums=('1fd034f4b636214cc24e94c563cd10b3f3444d9f0660927b60e63fd4131d97fa')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd libgdiplus-${pkgver}
  sed -i "s|src tests|src|g" Makefile.am
  sed -i "s|gdi32.c|gdi32.c win32-private.c|g" src/Makefile.am
  echo "libgdiplus_la_LDFLAGS = -no-undefined" >> src/Makefile.am
  echo "libgdiplus_la_LIBADD += -lgdi32" >> src/Makefile.am
  sed -i "s|Windows.h|windows.h|g" src/win32structs.h src/win32-private.c
  autoreconf -fiv
}

build() {
  cd "${srcdir}"/libgdiplus-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --without-x11
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/libgdiplus-${pkgver}/build-${_arch}
    make install DESTDIR="${pkgdir}"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

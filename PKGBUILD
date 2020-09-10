pkgname=mingw-w64-qt6-base-git
pkgver=5.15.0.r5319.g287d2d7753
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-pcre2' 'mingw-w64-md4c')
makedepends=('mingw-w64-cmake' 'mingw-w64-postgresql' 'mingw-w64-mariadb-connector-c'
             'mingw-w64-vulkan-headers' 'qt6-base' 'git')
options=('!buildflags' '!strip' 'staticlibs')
conflicts=(mingw-w64-qt6-base)
provides=(mingw-w64-qt6-base)
source=(git+https://code.qt.io/qt/qtbase.git#branch=dev)
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd qtbase
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd qtbase
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release -DQT_HOST_PATH=/usr \
      -DINSTALL_BINDIR=lib/qt6/bin \
      -DINSTALL_DOCDIR=share/doc/qt6 \
      -DINSTALL_ARCHDATADIR=lib/qt6 \
      -DINSTALL_DATADIR=share/qt6 \
      -DINSTALL_INCLUDEDIR=include/qt6 \
      -DINSTALL_MKSPECSDIR=lib/qt6/mkspecs \
      -DINSTALL_EXAMPLESDIR=share/doc/qt6/examples \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/qtbase/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

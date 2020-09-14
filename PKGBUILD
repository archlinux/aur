pkgname=mingw-w64-qt6-base-git
pkgver=5.15.0.r5420.g6718dea390
pkgrel=1
arch=(any)
url='https://www.qt.io'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='A cross-platform application and UI framework (mingw-w64)'
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-libjpeg-turbo' 'mingw-w64-sqlite'
         'mingw-w64-libpng' 'mingw-w64-openssl' 'mingw-w64-dbus' 'mingw-w64-harfbuzz'
         'mingw-w64-pcre2' 'mingw-w64-zstd')
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

prepare () {
  cd qtbase
  # fix pending in dbus
  echo "set_property(TARGET dbus-1 PROPERTY IMPORTED_IMPLIB \${DBus1_LIBRARY})" >> cmake/FindWrapDBus1.cmake
  # mariadb-connector-c: missing pkgconfig ?
  sed -i "s|MySQL::MySQL|MySQL::MySQL ssl crypto z ws2_32 shlwapi|g" src/plugins/sqldrivers/mysql/CMakeLists.txt
  # restore default import suffix
  sed -i 's|PROPERTY IMPORT_SUFFIX ".a"|PROPERTY IMPORT_SUFFIX ".dll.a"|g' cmake/QtTargetHelpers.cmake
}

build() {
  cd qtbase
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    PKG_CONFIG="/usr/bin/${_arch}-pkg-config" \
    ${_arch}-cmake -LAH \
      -DCMAKE_BUILD_TYPE=Release \
      -DQT_HOST_PATH=/usr \
      -DFEATURE_pkg_config=ON \
      -DFEATURE_system_harfbuzz=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/qtbase/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

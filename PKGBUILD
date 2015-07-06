# Maintainer: Stas Elensky <stas-at-flexsys-dot-com-dot-ua>

pkgname=mingw-w64-yajl
_pkgnameorig=yajl
pkgver=2.1.0
pkgrel=1
pkgdesc='Yet Another JSON Library (mingw-w64)'
arch=('any')
url='http://lloyd.github.com/yajl/'
license=('ISC')
makedepends=(mingw-w64-gcc mingw-w64-cmake)
depends=(mingw-w64-crt)
options=('!strip' '!buildflags' staticlibs)
source=("$_pkgnameorig-$pkgver.tar.gz::https://github.com/lloyd/$_pkgnameorig/archive/$pkgver.tar.gz")
md5sums=('6887e0ed7479d2549761a4d284d3ecb0')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS

  cd "$srcdir/yajl-$pkgver"

  # Source code uses WIN32 definition to include code specific to MSVC
  # However this makes MSVC specific code included when compiling under MinGW32
  # Fix it by changing WIN32 to _MSC_VER
  find . -type f -exec sed "s|WIN32|_MSC_VER|g" -i {} \;

  # We want the DLL to go into bin and archive into lib
  sed 's|RUNTIME DESTINATION lib${LIB_SUFFIX}|RUNTIME DESTINATION bin|g' -i src/CMakeLists.txt

  # Conform to Arch directory structure
  sed 's|DESTINATION share/pkgconfig|DESTINATION lib/pkgconfig|g' -i src/CMakeLists.txt

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}

    ${_arch}-cmake ..

    make

    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/yajl-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

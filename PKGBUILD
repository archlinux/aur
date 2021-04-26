pkgname=mingw-w64-szip
pkgver=2.1.1
pkgrel=1
pkgdesc="High compression library (mingw-w64)"
url="https://www.hdfgroup.org/doc_resource/SZIP"
license=('custom')
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://www.hdfgroup.org/ftp/lib-external/szip/${pkgver}/src/szip-${pkgver}.tar.gz")
sha256sums=('897dda94e1d4bf88c91adeaad88c07b468b18eaf2d6125c47acac57e540904a9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/szip-${pkgver}"

  # dont use msvc suffix
  sed -i 's|IMPORT_SUFFIX ".lib"|IMPORT_SUFFIX ".dll.a"|g' config/cmake/SZIPMacros.cmake

  # dont add twice the lib prefix
  sed -i 's|set (LIB_RELEASE_NAME "lib\${libname}")|set (LIB_RELEASE_NAME "\${libname}")|g' config/cmake/SZIPMacros.cmake
}

build() {
  cd "$srcdir/szip-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/szip-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/{COPYING,INSTALL,README,RELEASE.txt}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

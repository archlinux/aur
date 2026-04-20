pkgname=mingw-w64-openxlsx
pkgver=0.5.0
pkgrel=1
pkgdesc="A C++ library for reading, writing, creating and modifying Microsoft Excel (.xlsx) files (mingw-w64)"
arch=('any')
url="https://github.com/troldal/OpenXLSX"
license=('BSD-3-Clause')
depends=('mingw-w64-crt' 'mingw-w64-libzip' 'mingw-w64-pugixml' 'mingw-w64-boost')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/troldal/OpenXLSX/archive/v${pkgver}.tar.gz")
sha256sums=('3867a84b24c672f09a2698c1381c711fd41702cd6e65e2e3661ae56e01d89e44')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd OpenXLSX-$pkgver
  # fix shared lib detection
  sed -i 's|set(CMAKE_FIND_LIBRARY_SUFFIXES ".dll" ".lib" ".a")|set(CMAKE_FIND_LIBRARY_SUFFIXES ".dll.a")|g' cmake/manage_dependency.cmake
  sed -i 's/so|dll|dylib/so|dll.a|dylib/g' cmake/manage_dependency.cmake
  sed -i 's|get_target_property(LIBRARY_TYPE ${ARG_TARGET_NAME_SYSTEM} TYPE)|set(LIBRARY_TYPE SHARED_LIBRARY)|g' cmake/manage_dependency.cmake
  sed -i 's|TARGET_SHARED ${TARGET_STATIC} matches|TARGET_SHARED ${TARGET_SHARED} matches|g' cmake/manage_dependency.cmake

  # error: conflicting declaration 'using ssize_t = long long int'
  sed -i "/using ssize_t = long long/d" OpenXLSX/headers/XLZipArchive.hpp
}

build() {
  cd "${srcdir}/OpenXLSX-$pkgver"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DCMAKE_UNITY_BUILD=ON \
      -DOPENXLSX_LIBRARY_TYPE=SHARED \
      -DOPENXLSX_ENABLE_LIBZIP=ON \
      -DOPENXLSX_BUILD_SAMPLES=OFF \
      -DOPENXLSX_CREATE_DOCS=OFF \
      -DOPENXLSX_NOWIDE_STANDALONE=OFF \
      -DUSE_SYSTEM_LIBS=ON -B build-${_arch} -DPREFER_STATIC=OFF -DTARGET_SHARED=.
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir/OpenXLSX-${pkgver}/"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

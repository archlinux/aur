_pkgname=zlib-ng
pkgname=mingw-w64-zlib-ng
pkgver=2.3.3
pkgrel=1
pkgdesc="zlib replacement with optimizations for 'next generation' systems (mingw-w64)"
arch=('any')
url="https://github.com/zlib-ng/zlib-ng"
license=('Zlib')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/zlib-ng/zlib-ng/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f9c65aa9c852eb8255b636fd9f07ce1c406f061ec19a2e7d508b318ca0c907d1')

_srcdir="${_pkgname}-${pkgver}"
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=( -Wno-dev
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
    -DBUILD_TESTING=OFF
    -DWITH_SANITIZER=OFF
    -DWITH_RUNTIME_CPU_DETECTION=ON
	-DZLIB_COMPAT=OFF )

prepare() {
  cd $_srcdir
  sed 's|OUTPUT_NAME zlib${SUFFIX}|OUTPUT_NAME z${SUFFIX}|g' -i CMakeLists.txt
}

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" \
        "${_flags[@]}" \
        -DBUILD_SHARED_LIBS=OFF \
        -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
    cmake --build "build-${_arch}-static"
 
    ${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" \
        "${_flags[@]}"
    cmake --build "build-${_arch}"
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
    rm -rf "$pkgdir"/usr/${_arch}/static/share
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a

    DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}


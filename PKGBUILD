# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=blosc
pkgname=mingw-w64-${_pkgname}
pkgver=1.21.2
pkgrel=1
pkgdesc="A blocking, shuffling and loss-less compression library (mingw-w64)"
url="http://blosc.org/"
license=('BSD')
arch=('any')
depends=('mingw-w64-zstd' 'mingw-w64-snappy' 'mingw-w64-lz4' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Blosc/c-blosc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e5b4ddb4403cbbad7aab6e9ff55762ef298729c8a793c6147160c771959ea2aa')

_srcdir="c-blosc-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release
	-DCMAKE_C_FLAGS_RELEASE='-DNDEBUG'
	-DPREFER_EXTERNAL_LZ4=ON
	-DPREFER_EXTERNAL_ZLIB=ON
	-DPREFER_EXTERNAL_ZSTD=ON
	-DDEACTIVATE_AVX2=ON
	-DBUILD_BENCHMARKS=OFF
	-DBUILD_FUZZERS=OFF
	-DDEACTIVATE_SNAPPY=OFF )

prepare() {
	cd "$_srcdir"

	# dont use bundled pthread (missing _WIN32_WINNT 0x0600 define)
	sed -i 's|#include "win32/pthread.h"|#include <pthread.h>|g' blosc/blosc.c blosc/shuffle.c
	sed -i 's|#include "win32/pthread.c"||g' blosc/blosc.c
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DBUILD_STATIC=ON \
			-DBUILD_TESTS=OFF
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

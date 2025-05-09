# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=blosc
pkgname=mingw-w64-${_pkgname}
pkgver=1.21.6
pkgrel=1
pkgdesc="A blocking, shuffling and loss-less compression library (mingw-w64)"
url="http://blosc.org/"
license=('BSD-3-Clause')
arch=('any')
depends=('mingw-w64-zstd' 'mingw-w64-snappy' 'mingw-w64-lz4' 'mingw-w64-zlib')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Blosc/c-blosc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9fcd60301aae28f97f1301b735f966cc19e7c49b6b4321b839b4579a0c156f38')

_srcdir="c-blosc-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE='Release'
	-DCMAKE_C_FLAGS_RELEASE='-DNDEBUG'
	-DPREFER_EXTERNAL_LZ4=ON
	-DPREFER_EXTERNAL_ZLIB=ON
	-DPREFER_EXTERNAL_ZSTD=ON
	-DDEACTIVATE_AVX2=ON
	-DBUILD_BENCHMARKS=OFF
	-DBUILD_FUZZERS=OFF
	-DDEACTIVATE_SNAPPY=OFF
	-DCMAKE_POLICY_VERSION_MINIMUM=3.5 )

prepare() {
	cd "$_srcdir"

	# dont use bundled pthread (missing _WIN32_WINNT 0x0600 define)
	sed -i 's|#include "win32/pthread.h"|#include <pthread.h>|g' blosc/blosc.c blosc/shuffle.c
	sed -i 's|#include "win32/pthread.c"||g' blosc/blosc.c

	sed -i 's/add_test(${test_name} ${target}/add_test(NAME ${test_name} COMMAND ${target}/' 'tests/CMakeLists.txt'
	sed -i 's/add_test(${target} ${target})/add_test(NAME ${target} COMMAND ${target})/' 'tests/CMakeLists.txt'
	sed -i 's/add_test(test_compat_${fname} filegen/add_test(NAME test_compat_${fname} COMMAND filegen/' 'compat/CMakeLists.txt'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DBUILD_STATIC=ON \
			-DBUILD_TESTS=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DBUILD_TESTS=ON
		cmake --build "build-${_arch}"
		cmake --build "build-${_arch}" --target test
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

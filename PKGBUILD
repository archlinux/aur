# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=libdeflate
pkgname=mingw-w64-${_pkgname}
pkgver=1.19
pkgrel=1
pkgdesc='Heavily optimized library for DEFLATE/zlib/gzip compression and decompression (mingw-w64)'
url="https://github.com/ebiggers/${_pkgname}"
arch=(any)
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
checkdepends=('mingw-w64-wine')
options=('staticlibs' '!buildflags' '!strip')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/ebiggers/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('27bf62d71cd64728ff43a9feb92f2ac2f2bf748986d856133cc1e51992428c25')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release
	-DCMAKE_C_FLAGS_RELEASE='-DNDEBUG' )
_srcdir="${_pkgname}-${pkgver}"

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DLIBDEFLATE_BUILD_SHARED_LIB=ON \
			-DLIBDEFLATE_BUILD_STATIC_LIB=ON \
			-DLIBDEFLATE_USE_SHARED_LIB=OFF \
			-DLIBDEFLATE_BUILD_TESTS=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DLIBDEFLATE_BUILD_TESTS=ON
		cmake --build "build-${_arch}"
		cmake --build "build-${_arch}" --target test
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

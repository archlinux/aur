# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: drakkan <nicola.murino at gmail dot com>

_pkgname=libwebp
pkgname=mingw-w64-${_pkgname}
pkgver=1.6.0
pkgrel=1
pkgdesc="WebP library and conversion tools (mingw-w64)"
arch=(any)
url="https://developers.google.com/speed/webp/"
license=('BSD-3-Clause')
makedepends=(mingw-w64-cmake git ninja)
depends=(mingw-w64-libjpeg-turbo mingw-w64-libpng mingw-w64-libtiff mingw-w64-giflib)
options=(staticlibs !strip !buildflags)
source=("https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-$pkgver.tar.gz"{,.asc})
sha256sums=('e4ab7009bf0629fd11982d4c2aa83964cf244cffba7347ecd39019a9e38c4564'
            'SKIP')

validpgpkeys=('6B0E6B70976DE303EDF2F601F9C3D6BDB8232B5D') # WebP release signing key

_srcdir="${_pkgname}-${pkgver}"
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=(
	-Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DWEBP_ENABLE_SWAP_16BIT_CSP=ON )

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DBUILD_SHARED_LIBS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static" \
			-DCMAKE_FIND_NO_INSTALL_PREFIX=ON
		cmake --build "build-${_arch}-static"

		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		rm -rf "$pkgdir"/usr/${_arch}/static/share
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a

		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

# vim: ts=2 sw=2 et:

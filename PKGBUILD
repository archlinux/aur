# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-libheif
pkgver=1.11.0
pkgrel=3
pkgdesc="HEIF file format decoder and encoder. (mingw-w64)"
url="https://github.com/strukturag/libheif"
license=("LGPL")
depends=(
	"mingw-w64-crt"
	"mingw-w64-libpng"
	"mingw-w64-libjpeg-turbo"
	"mingw-w64-aom"
	"mingw-w64-x265"
	"mingw-w64-rav1e"
	"mingw-w64-dav1d"
)
makedepends=("mingw-w64-cmake")
arch=("any")
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=(
	"993c3320e179b8fdce983e3a7e96615af3830077be6b0ab28bfa25579df08d26"
)
source=(
	"https://github.com/strukturag/libheif/archive/v${pkgver}.tar.gz"
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" -DCMAKE_CXX_STANDARD_LIBRARIES="-lws2_32 -lwsock32 -luserenv" -DWITH_EXAMPLES=OFF )
	
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "libheif-${pkgver}" -B "build-${_arch}" "${_flags[@]}"
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

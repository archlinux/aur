# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-libheif
pkgver=1.10.0
pkgrel=1
pkgdesc="HEIF file format decoder and encoder. (mingw-w64)"
url="https://github.com/strukturag/libheif"
license=("LGPL")
depends=(
	"mingw-w64-crt"
	"mingw-w64-libpng"
	"mingw-w64-libjpeg-turbo"
	"mingw-w64-aom"
	#"mingw-w64-x265"
)
makedepends=("mingw-w64-cmake")
arch=("any")
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=(
	"317a44bf157ba297638ab5a258040ef6ec4895d620cd58f52195f3f89c9eea28"
)
source=(
	"https://github.com/strukturag/libheif/archive/v${pkgver}.tar.gz"
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" -DWITH_EXAMPLES=OFF )
	
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "libheif-${pkgver}" -B "build-${_arch}" "${_flags[@]}"
		make -C "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

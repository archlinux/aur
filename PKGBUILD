# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=libheif
pkgname=mingw-w64-${_pkgname}
pkgver=1.13.0
pkgrel=1
pkgdesc='HEIF file format decoder and encoder (mingw-w64)'
url='https://github.com/strukturag/libheif'
license=("LGPL")
depends=(
	'mingw-w64-crt'
	'mingw-w64-libpng'
	'mingw-w64-libjpeg-turbo'
	'mingw-w64-aom'
	'mingw-w64-x265'
	'mingw-w64-rav1e'
	'mingw-w64-dav1d'
)
makedepends=('mingw-w64-cmake')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=('50def171af4bc8991211d6027f3cee4200a86bbe60fddb537799205bf216ddca')
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/strukturag/libheif/archive/v${pkgver}.tar.gz"
)

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=(
	-Wno-dev
	-DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DCMAKE_CXX_STANDARD_LIBRARIES='-lws2_32 -lwsock32 -luserenv -lbcrypt'
	-DWITH_EXAMPLES=OFF )

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

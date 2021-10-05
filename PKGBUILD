# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=openexr
pkgname=mingw-w64-${_pkgname}
pkgver=3.1.2
pkgrel=1
pkgdesc='An high dynamic-range image file format library (mingw-w64)'
url='http://www.openexr.com/'
arch=(any)
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-imath')
makedepends=('mingw-w64-cmake')
checkdepends=('mingw-w64-wine')
options=('staticlibs' '!buildflags' '!strip')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/${_pkgname}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
	'f5c8f148e8f972e76b47e802aada1c59ef1837f0a9259c6677756e7cd347640f'
)

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG -msse4.2' -DCMAKE_C_FLAGS_RELEASE='-O2 -DNDEBUG -msse4.2 -D__USE_MINGW_ANSI_STDIO=1'
	-DOPENEXR_INSTALL_EXAMPLES=OFF -DOPENEXR_LIB_SUFFIX= )
_srcdir="${_pkgname}-${pkgver}"

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DDOPENEXR_INSTALL_TOOLS=OFF -DOPENEXR_BUILD_TOOLS=OFF -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DOPENEXR_INSTALL_TOOLS=ON -DOPENEXR_BUILD_TOOLS=ON -DBUILD_TESTING=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=ON
		cmake --build "build-${_arch}"
		cmake --build "build-${_arch}" --target test
	done
}

package() {
  for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
    DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

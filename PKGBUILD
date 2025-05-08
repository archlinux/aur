# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=pystring
pkgname=mingw-w64-${_pkgname}
pkgver=1.1.4
pkgrel=1
pkgdesc='C++ functions matching the interface and behavior of python string methods with std::string (mingw-w64)'
arch=(any)
url='https://github.com/imageworks/pystring'
license=('BSD-3-Clause')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/imageworks/pystring/archive/v${pkgver}.tar.gz"
	'BuildPystring.cmake')
sha256sums=('49da0fe2a049340d3c45cce530df63a2278af936003642330287b68cefd788fb'
            '29c25f4faaa2b0e7bb7132d07c93e0cea577af1ae3d657714ec3db8077f8b2e2')

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' )

prepare() {
	cp -f 'BuildPystring.cmake' "$_srcdir/CMakeLists.txt"
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DBUILD_SHARED_LIBS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
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

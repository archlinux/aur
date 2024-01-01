# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=fmt
pkgname=mingw-w64-${_pkgname}
pkgver=10.2.0
pkgrel=1
pkgdesc='Open-source formatting library for C++ (mingw-w64)'
url='https://fmt.dev/'
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
checkdepends=('mingw-w64-wine')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=('3ca91733a7313a8ad41c0885929415f8ec0a2a31d4dc7e27e9331412f4ca26ac')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/fmtlib/${_pkgname}/archive/${pkgver}.tar.gz")

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' \
	-DFMT_DOC=OFF
	-DCMAKE_CXX_STANDARD=20 )

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DFMT_TEST=OFF \
			-DBUILD_SHARED_LIBS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DFMT_TEST=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DFMT_TEST=ON
		cmake --build "build-${_arch}"
		cmake --build "build-${_arch}" --target test
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
	done
}

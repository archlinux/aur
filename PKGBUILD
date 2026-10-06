# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=log4cplus
pkgname=mingw-w64-${_pkgname}
pkgver=2.2.1
pkgrel=1
pkgdesc="A C++ logger very close to Java's log4j (mingw-w64)"
url='http://log4cplus.sourceforge.net/'
license=('BSD-2-Clause' 'Apache-2.0')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
checkdepends=('mingw-w64-wine')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
source=("https://github.com/${_pkgname}/${_pkgname}/releases/download/REL_${pkgver//./_}/${_pkgname}-${pkgver}.tar.xz")
sha512sums=('03afe4d832564fd502f4c93887e601fdea67f58de0ce3911b283bd1344cd76c1e55eb4b4a0146d7360cb235bf4fd26dc7d4e53721c9b21e9b04727a6a839eae2')

_srcdir="${_pkgname}-${pkgver}"
_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' )

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DWITH_UNIT_TESTS=OFF \
			-DLOG4CPLUS_BUILD_TESTING=OFF \
			-DBUILD_SHARED_LIBS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"

		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DWITH_UNIT_TESTS=OFF \
			-DLOG4CPLUS_BUILD_TESTING=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		ARCH_CMAKE=${_arch}-cmake ${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DWITH_UNIT_TESTS=ON \
			-DLOG4CPLUS_BUILD_TESTING=ON
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

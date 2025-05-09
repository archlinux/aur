# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=log4cplus
pkgname=mingw-w64-${_pkgname}
pkgver=2.1.2
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
source=("https://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.xz")
sha512sums=('d6285e4964e8eda072b61e0585d5fe08c1d942b688752baf75ba230d49691070156ab4da1803d82d0c09128bcb87e21910e38ee9441df13ff762d527fe431444')

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
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

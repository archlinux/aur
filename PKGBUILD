# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=imath
pkgname=mingw-w64-${_pkgname}
pkgver=3.1.12
pkgrel=1
pkgdesc='A C++ and python library of 2D and 3D vector, matrix, and math operations for computer graphics (mingw-w64)'
url='https://github.com/AcademySoftwareFoundation/Imath'
arch=(any)
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'wine')
checkdepends=('mingw-w64-wine')
options=('staticlibs' '!buildflags' '!strip')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8a1bc258f3149b5729c2f4f8ffd337c0e57f09096e4ba9784329f40c4a9035da')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' -DIMATH_LIB_SUFFIX= )
_srcdir="Imath-${pkgver}"

prepare() {
	cd "${_srcdir}"
	sed -i -r \
		-e 's/\$<TARGET_FILE:ImathTest>/ImathTest/' \
		-e 's/\$<TARGET_FILE:ImathHalfCTest>/ImathHalfCTest/' \
		-e 's/\$<TARGET_FILE:ImathHalfPerfTest>/ImathHalfPerfTest/' \
		'src/ImathTest/CMakeLists.txt'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_TESTING=OFF \
			-DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"

		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=OFF
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
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

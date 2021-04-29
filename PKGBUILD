# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-imath
pkgver=3.0.1
pkgrel=2
pkgdesc="Imath is a basic, light-weight, and efficient C++ representation of 2D and 3D vectors and matrices and other simple but useful mathematical objects, functions and data types (mingw-w64)"
url="https://github.com/AcademySoftwareFoundation/Imath"
arch=(any)
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'wine')
checkdepends=('mingw-w64-wine')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("9cd984bb6b0a9572dd4a373b1fab60bc4c992a52ec5c68328fe0f48f194ba3c0")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" )

prepare() {
	cd "Imath-${pkgver}"
	sed -i -r 's/\$<TARGET_FILE:ImathTest>/\${CMAKE_CROSSCOMPILING_EMULATOR} \$<TARGET_FILE:ImathTest>/' 'src/ImathTest/CMakeLists.txt'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "Imath-${pkgver}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "Imath-${pkgver}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=ON
		cmake --build "build-${_arch}"
		cmake --build "build-${_arch}" --target test
	done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

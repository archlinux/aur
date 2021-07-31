# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-imath
pkgver=3.1.2
pkgrel=1
pkgdesc="A C++ and python library of 2D and 3D vector, matrix, and math operations for computer graphics (mingw-w64)"
url="https://github.com/AcademySoftwareFoundation/Imath"
arch=(any)
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'wine')
checkdepends=('mingw-w64-wine')
options=('staticlibs' '!buildflags' '!strip')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
	'f21350efdcc763e23bffd4ded9bbf822e630c15ece6b0697e2fcb42737c08c2d'
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" )
_srcdir="Imath-${pkgver}"

prepare() {
	cd "${_srcdir}"
	sed -i -r 's/\$<TARGET_FILE:ImathTest>/\${CMAKE_CROSSCOMPILING_EMULATOR} \$<TARGET_FILE:ImathTest>/' 'src/ImathTest/CMakeLists.txt'
}

build() {
	for _arch in ${_architectures}; do
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
    DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

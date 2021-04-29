# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-openexr
pkgver=3.0.1
pkgrel=2
pkgdesc="An high dynamic-range image file format library (mingw-w64)"
url="http://www.openexr.com/"
arch=(any)
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-imath')
makedepends=('mingw-w64-cmake' 'wine')
checkdepends=('mingw-w64-wine')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/AcademySoftwareFoundation/openexr/archive/v${pkgver}.tar.gz")
sha256sums=("6d14a8df938bbbd55dd6e55b24c527fe9323fe6a45f704e56967dfbf477cecc1")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" 
	-DOPENEXR_BUILD_UTILS=OFF -DOPENEXR_INSTALL_EXAMPLES=OFF -DOPENEXR_INSTALL_TOOLS=OFF )

prepare() {
	cd "openexr-${pkgver}"
	find . -name "CMakeLists.txt" -print0 | xargs -0 sed -i -r 's/COMMAND \$<TARGET_FILE/COMMAND \${CMAKE_CROSSCOMPILING_EMULATOR} \$<TARGET_FILE/'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "openexr-${pkgver}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "openexr-${pkgver}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=ON
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

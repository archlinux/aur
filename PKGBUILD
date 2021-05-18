# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-openexr
pkgver=3.0.2
pkgrel=1
pkgdesc="An high dynamic-range image file format library (mingw-w64)"
url="http://www.openexr.com/"
arch=(any)
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-imath')
makedepends=('mingw-w64-cmake' 'wine')
checkdepends=('mingw-w64-wine')
options=('staticlibs' '!buildflags' '!strip')
source=(
	"https://github.com/AcademySoftwareFoundation/openexr/archive/v${pkgver}.tar.gz"
	"https://github.com/AcademySoftwareFoundation/openexr/pull/1022.patch"
)
sha256sums=(
	"afcfaaba700d0bc86a54e9c2e51b22b9dd458527571046f02951ef75ddc7c8e2"
	"95288d05e9e90b86ca88a904387f9a1cba8ce96df6f86704a8a2467f0ba40a44"
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" 
	-DOPENEXR_BUILD_UTILS=OFF -DOPENEXR_INSTALL_EXAMPLES=OFF -DOPENEXR_INSTALL_TOOLS=OFF )
_dir="openexr-${pkgver}"

prepare() {
	cd "${_dir}"
	patch -p1 -i "../1022.patch"
	find . -name "CMakeLists.txt" -print0 | xargs -0 sed -i -r 's/COMMAND \$<TARGET_FILE/COMMAND \${CMAKE_CROSSCOMPILING_EMULATOR} \$<TARGET_FILE/'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_dir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_dir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=ON
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

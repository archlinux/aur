# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-openexr
pkgver=3.1.0
pkgrel=1
pkgdesc="An high dynamic-range image file format library (mingw-w64)"
url="http://www.openexr.com/"
arch=(any)
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-imath')
makedepends=('mingw-w64-cmake')
checkdepends=('mingw-w64-wine')
options=('staticlibs' '!buildflags' '!strip')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/openexr/archive/v${pkgver}.tar.gz"
	"mingw_patch.patch::https://github.com/AcademySoftwareFoundation/openexr/commit/b579b6a7a2d680d591aa15028402d3c42b0069ee.patch"
)
sha256sums=(
	'8c2ff765368a28e8210af741ddf91506cef40f1ed0f1a08b6b73bb3a7faf8d93'
	'a73250add0e690518e2312ea3c30cc3083dd66019fdd8a47b79418d3493d5de9'
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG -msse4.2" -DCMAKE_C_FLAGS_RELEASE="-O2 -DNDEBUG -msse4.2 -D__USE_MINGW_ANSI_STDIO=1 -Wno-error=format-security"
	-DOPENEXR_INSTALL_EXAMPLES=OFF -DOPENEXR_INSTALL_TOOLS=ON )
_srcdir="openexr-${pkgver}"

prepare() {
	cd "${_srcdir}"
	patch -N -p1 -i "${srcdir}/mingw_patch.patch"
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

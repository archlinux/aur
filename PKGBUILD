# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=openexr
pkgname=mingw-w64-${_pkgname}
pkgver=3.2.2
pkgrel=1
pkgdesc='An high dynamic-range image file format library (mingw-w64)'
url='http://www.openexr.com/'
arch=(any)
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-zlib' 'mingw-w64-imath' 'mingw-w64-libdeflate')
makedepends=('mingw-w64-cmake')
checkdepends=('mingw-w64-wine' 'python')
options=('staticlibs' '!buildflags' '!strip')
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/${_pkgname}/archive/v${pkgver}.tar.gz"
)
sha256sums=('65de6459c245a4977ce4d7777e70b30d7ef48ec38e0cfb10205706ca50a8bf2e')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG -msse4.2'
	-DCMAKE_C_FLAGS_RELEASE='-DNDEBUG -msse4.2'
	-DOPENEXR_INSTALL_EXAMPLES=OFF
	-DOPENEXR_LIB_SUFFIX= )
_srcdir="${_pkgname}-${pkgver}"

prepare() {
	cd "${_srcdir}"
	sed -i 's/if defined(_MSC_VER) && defined(_WIN32)/ifdef _WIN32/' 'src/lib/OpenEXRCore/internal_cpuid.h'
	sed -i 's/run (\[exr/run (\[os.environ\["CC_EMULATOR"\], exr/;s/command = \[/command = \[os.environ\["CC_EMULATOR"\], /' 'src/test/bin/test_'*.py
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DOPENEXR_INSTALL_TOOLS=OFF \
			-DOPENEXR_BUILD_TOOLS=OFF \
			-DBUILD_TESTING=OFF \
			-DBUILD_SHARED_LIBS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DOPENEXR_INSTALL_TOOLS=ON \
			-DOPENEXR_BUILD_TOOLS=ON \
			-DBUILD_TESTING=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=ON
		cmake --build "build-${_arch}"
		CC_EMULATOR=${_arch}-wine cmake --build "build-${_arch}" --target test
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

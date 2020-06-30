# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-opencolorio
pkgver=1.1.1
pkgrel=1
pkgdesc="OpenColorIO (OCIO) is a complete color management solution geared towards motion picture production with an emphasis on visual effects and computer animation."
arch=(any)
url="https://opencolorio.org/"
license=("BSD-3-Clause")
makedepends=('mingw-w64-cmake')
depends=(
	'mingw-w64-crt'
	'mingw-w64-yaml-cpp'
	'mingw-w64-tinyxml'
	'mingw-w64-lcms2')
options=('!strip' '!buildflags' 'staticlibs')
source=(
	"https://github.com/AcademySoftwareFoundation/OpenColorIO/archive/v${pkgver}.tar.gz"
	"fix.patch"
)
sha256sums=(
	"c9b5b9def907e1dafb29e37336b702fff22cc6306d445a13b1621b8a754c14c8"
	"f1893a9877d3840ed5aeae6d202c03c90bf146e7f9f9b5822678a9e4aaec627f"
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_dir="OpenColorIO-${pkgver}"

prepare() {
	cd "${_dir}"
	patch -uNp1 < "../fix.patch"
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DOCIO_BUILD_APPS=OFF -DOCIO_USE_SSE=ON -DUSE_EXTERNAL_YAML=ON
		-DUSE_EXTERNAL_TINYXML=ON -DUSE_EXTERNAL_LCMS=ON -DCMAKE_VISIBILITY_INLINES_HIDDEN=ON -DCMAKE_CXX_VISIBILITY_PRESET=hidden
		-DOCIO_INLINES_HIDDEN=ON -DOCIO_BUILD_TESTS=OFF -DOCIO_BUILD_PYGLUE=OFF -DOCIO_BUILD_JNIGLUE=OFF
		-DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" )
		
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_dir}" -B "build-${_arch}" "${_flags[@]}"
		make -C "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

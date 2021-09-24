# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-opencolorio1
pkgver=1.1.1
pkgrel=2
pkgdesc='A color management framework for visual effects and animation (mingw-w64)'
arch=(any)
url='https://opencolorio.org/'
license=('BSD-3-Clause')
makedepends=('mingw-w64-cmake')
depends=(
	'mingw-w64-crt'
	'mingw-w64-yaml-cpp'
	'mingw-w64-tinyxml'
	'mingw-w64-lcms2')
options=('!strip' '!buildflags' 'staticlibs')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/OpenColorIO/archive/v${pkgver}.tar.gz"
	'fix.patch'
	'make-coinstallable.patch'
)
sha256sums=(
	'c9b5b9def907e1dafb29e37336b702fff22cc6306d445a13b1621b8a754c14c8'
	'f1893a9877d3840ed5aeae6d202c03c90bf146e7f9f9b5822678a9e4aaec627f'
	'2f3fd3b72a4927f905ff3f66290cb6d404f6384b1a9f032ff73ad5cc1637469b'
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_dir="OpenColorIO-${pkgver}"

prepare() {
	cd "${_dir}"
	
	patch -uNp1 -i '../fix.patch'
	patch -p1 -i '../make-coinstallable.patch'
	
	sed -i "s/-Werror//g" 'src/core/CMakeLists.txt'
	sed -i "s/-Werror//g" 'src/pyglue/CMakeLists.txt'
	sed -i "s/push(hidden)/push(default)/g" 'src/core/OCIOYaml.cpp'
	sed -i 's/OUTPUT_NAME                 OpenColorIO/OUTPUT_NAME                 OpenColorIO1/' 'src/core/CMakeLists.txt'
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DOCIO_BUILD_APPS=OFF -DOCIO_USE_SSE=ON -DUSE_EXTERNAL_YAML=ON
		-DUSE_EXTERNAL_TINYXML=ON -DUSE_EXTERNAL_LCMS=ON -DCMAKE_VISIBILITY_INLINES_HIDDEN=ON -DCMAKE_CXX_VISIBILITY_PRESET=hidden
		-DOCIO_INLINES_HIDDEN=ON -DOCIO_BUILD_TESTS=OFF -DOCIO_BUILD_PYGLUE=OFF -DOCIO_BUILD_JNIGLUE=OFF
		-DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG' )
		
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_dir}" -B "build-${_arch}" "${_flags[@]}"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		rm -rf "$pkgdir/usr/${_arch}/share"
		mv -f "$pkgdir/usr/${_arch}/lib/pkgconfig/OpenColorIO.pc" "$pkgdir/usr/${_arch}/lib/pkgconfig/OpenColorIO1.pc"
		install -dm755 "$pkgdir/usr/${_arch}/lib/cmake"
		mv -f "$pkgdir/usr/${_arch}/cmake" "$pkgdir/usr/${_arch}/lib/cmake/OpenColorIO1"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

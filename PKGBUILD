# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-opencolorio
pkgver=2.1.0
pkgrel=1
pkgdesc='A color management framework for visual effects and animation (mingw-w64)'
arch=(any)
url='https://opencolorio.org/'
license=('BSD-3-Clause')
makedepends=('mingw-w64-cmake' 'git')
depends=(
	'mingw-w64-crt'
	'mingw-w64-yaml-cpp'
	'mingw-w64-lcms2'
	'mingw-w64-freeglut'
	'mingw-w64-glew'
	'mingw-w64-imath')
options=('!strip' '!buildflags' 'staticlibs')
_repo='OpenColorIO'
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/${_repo}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
	'81fc7853a490031632a69c73716bc6ac271b395e2ba0e2587af9995c2b0efb5f'
)

_srcdir="${_repo}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DOCIO_BUILD_APPS=OFF -DOCIO_USE_SSE=ON -DOCIO_BUILD_PYTHON=OFF 
		-DCMAKE_VISIBILITY_INLINES_HIDDEN=ON -DCMAKE_CXX_VISIBILITY_PRESET=hidden
		-DCMAKE_CXX_STANDARD=17 -DOCIO_INSTALL_EXT_PACKAGES=NONE
		-DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG -msse4.2' )
		
prepare() {
	cd "${_srcdir}"
	sed -i -r 's/if\(NOT WIN32\)/if\(NOT WIN32 OR MINGW\)/' 'src/OpenColorIO/CMakeLists.txt'
	sed -i -r 's/if\(WIN32\)/if\(WIN32 AND NOT MINGW\)/' 'src/OpenColorIO/CMakeLists.txt'
	sed -i -r 's/\$\{OCIO_LIBNAME_SUFFIX\}_\$\{OpenColorIO_VERSION_MAJOR\}_\$\{OpenColorIO_VERSION_MINOR\}/${OCIO_LIBNAME_SUFFIX}/' 'src/OpenColorIO/CMakeLists.txt'
	sed -i -r 's/add_test\(test_utils_exec test_utils_exec\)/add_test\(NAME test_utils_exec COMMAND test_utils_exec\)/' 'tests/utils/CMakeLists.txt'
	sed -i -r 's/add_test\(\$\{TEST_NAME\} \$\{TEST_BINARY\}\)/add_test(NAME ${TEST_NAME} COMMAND ${TEST_BINARY})/' 'tests/cpu/CMakeLists.txt'
	sed -i -r "s/filename = tmpFilename;/filename = tmpFilename[0] == '\\\\\\\\' ? tmpFilename + 1 : tmpFilename;/" 'src/OpenColorIO/Platform.cpp'
}

build() {	
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DOCIO_BUILD_TESTS=OFF -DOCIO_BUILD_GPU_TESTS=OFF \
			-DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DOCIO_BUILD_TESTS=OFF -DOCIO_BUILD_GPU_TESTS=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DOCIO_BUILD_TESTS=ON -DOCIO_BUILD_GPU_TESTS=OFF
		cmake --build "build-${_arch}"
		cmake --build "build-${_arch}" --target test
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		rm -rf "$pkgdir"/usr/${_arch}/static/share
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		rm -rf "$pkgdir"/usr/${_arch}/share
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

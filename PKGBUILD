# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=opencolorio
pkgname=mingw-w64-${_pkgname}
pkgver=2.1.2
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
checkdepends=('mingw-w64-wine')
options=('!strip' '!buildflags' 'staticlibs')
_repo='OpenColorIO'
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/${_repo}/archive/v${pkgver}.tar.gz"
)
sha256sums=('6c6d153470a7dbe56136073e7abea42fa34d06edc519ffc0a159daf9f9962b0b')

_srcdir="${_repo}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DOCIO_BUILD_APPS=OFF -DOCIO_USE_SSE=ON -DOCIO_BUILD_PYTHON=OFF 
		-DCMAKE_VISIBILITY_INLINES_HIDDEN=ON -DCMAKE_CXX_VISIBILITY_PRESET=hidden
		-DCMAKE_CXX_STANDARD=17 -DOCIO_INSTALL_EXT_PACKAGES=NONE
		-DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG -msse4.2' )
		
prepare() {
	cd "${_srcdir}"
	sed -i 's/if(NOT WIN32)/if(NOT WIN32 OR MINGW)/' 'src/OpenColorIO/CMakeLists.txt'
	sed -i 's/if(WIN32)/if(WIN32 AND NOT MINGW)/' 'src/OpenColorIO/CMakeLists.txt'
	#sed -i -r 's/_WIN32/_MVS_VER/;s/::strto/strto/' 'src/utils/NumberUtils.h'
	sed -i 's/_str/str/g;s/_l(/(/g;s/, loc.local//g;s|static const Locale loc;|//static const Locale loc;|' 'src/utils/NumberUtils.h'
	#sed -i 's/${OCIO_LIBNAME_SUFFIX}_${OpenColorIO_VERSION_MAJOR}_${OpenColorIO_VERSION_MINOR}${OCIO_LIBNAME_SUFFIX}/' 'src/OpenColorIO/CMakeLists.txt'
	#sed -i 's/_WIN32/MSVC/g' 'src/utils/NumberUtils.h'
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

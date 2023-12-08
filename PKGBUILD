# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=opencolorio
pkgname=mingw-w64-${_pkgname}
pkgver=2.3.1
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
	'mingw-w64-imath'
	'mingw-w64-minizip-ng'
	'mingw-w64-expat'
	'mingw-w64-pystring')
checkdepends=('mingw-w64-wine')
options=('!strip' '!buildflags' 'staticlibs')
_repo='OpenColorIO'
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/${_repo}/archive/v${pkgver}.tar.gz"
	'ocio-system-monitor-mingw.patch')
sha256sums=('7196e979a0449ce28afd46a78383476f3b8fc1cc1d3a417192be439ede83437b'
            '73697fbd06b3f51cfd0a2df3579fc8579725b2a927edefa736fdb1fb2a361337')

_srcdir="${_repo}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG -msse4.2 -mxsave'
	-DOCIO_BUILD_APPS=OFF
	-DOCIO_BUILD_PYTHON=OFF
	-DCMAKE_VISIBILITY_INLINES_HIDDEN=ON -DCMAKE_CXX_VISIBILITY_PRESET=hidden
	-DCMAKE_CXX_STANDARD=20
	-DOCIO_INSTALL_EXT_PACKAGES=NONE )

prepare() {
	cd "${_srcdir}"
	sed -i 's/if(NOT WIN32)/if(NOT WIN32 OR MINGW)/' 'src/OpenColorIO/CMakeLists.txt'
	sed -i 's/if(WIN32)/if(WIN32 AND NOT MINGW)/' 'src/OpenColorIO/CMakeLists.txt'
	sed -i 's/_str/str/g;s/_l(/(/g;s/_l (/ (/g;s/, loc.local//g;s|static const Locale loc;|//static const Locale loc;|' 'src/utils/NumberUtils.h'
	
	rm -f 'share/cmake/modules/Findyaml-cpp.cmake'
	sed -i 's|${CMAKE_CURRENT_LIST_DIR}/share/cmake/modules/Findyaml-cpp.cmake||' 'CMakeLists.txt'
	
	sed -i 's/#if _MSC_VER/#if _WIN32/' 'src/OpenColorIO/CPUInfo.cpp'
	
	patch -p1 -i "${srcdir}/ocio-system-monitor-mingw.patch"
}

build() {	
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-DOCIO_BUILD_TESTS=OFF -DOCIO_BUILD_GPU_TESTS=OFF \
			-DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DOCIO_BUILD_TESTS=OFF -DOCIO_BUILD_GPU_TESTS=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DOCIO_BUILD_TESTS=ON -DOCIO_BUILD_GPU_TESTS=OFF
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

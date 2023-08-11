# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=opencolorio
pkgname=mingw-w64-${_pkgname}
pkgver=2.2.1
pkgrel=3
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
	'mingw-w64-minizip-ng')
checkdepends=('mingw-w64-wine')
options=('!strip' '!buildflags' 'staticlibs')
_repo='OpenColorIO'
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/AcademySoftwareFoundation/${_repo}/archive/v${pkgver}.tar.gz"
	'minizip-ng-4.patch'
)
sha256sums=('36f27c5887fc4e5c241805c29b8b8e68725aa05520bcaa7c7ec84c0422b8580e'
            '2f63b50e09d493b0e29d98ce579722a53a296834bf244819823764b41f5bedbd')

_srcdir="${_repo}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG -msse4.2'
	-DOCIO_BUILD_APPS=OFF
	-DOCIO_USE_SSE=ON
	-DOCIO_BUILD_PYTHON=OFF 
	-DCMAKE_VISIBILITY_INLINES_HIDDEN=ON -DCMAKE_CXX_VISIBILITY_PRESET=hidden
	-DCMAKE_CXX_STANDARD=20
	-DOCIO_INSTALL_EXT_PACKAGES=NONE )

prepare() {
	cd "${_srcdir}"
	sed -i 's/if(NOT WIN32)/if(NOT WIN32 OR MINGW)/' 'src/OpenColorIO/CMakeLists.txt'
	sed -i 's/if(WIN32)/if(WIN32 AND NOT MINGW)/' 'src/OpenColorIO/CMakeLists.txt'
	sed -i 's/_str/str/g;s/_l(/(/g;s/_l (/ (/g;s/, loc.local//g;s|static const Locale loc;|//static const Locale loc;|' 'src/utils/NumberUtils.h'
	#sed -i -r 's|#include "minizip-ng/(.*)"|#include <\1>|' 'src/OpenColorIO/OCIOZArchive.cpp'
	sed -i 's/std::tstring/std::string/g;s/std::tostringstream/std::ostringstream/g' 'src/OpenColorIO/SystemMonitor_windows.cpp'
	sed -i 's/targetName.monitorFriendlyDeviceName : L""/Platform::Utf16ToUtf8(targetName.monitorFriendlyDeviceName) : ""/' 'src/OpenColorIO/SystemMonitor_windows.cpp'
	sed -i 's/Platform::Utf16ToUtf8(deviceName)/deviceName/' 'src/OpenColorIO/SystemMonitor_windows.cpp'
	rm -f 'share/cmake/modules/Findminizip-ng.cmake'
	sed -i 's|${CMAKE_CURRENT_LIST_DIR}/share/cmake/modules/Findminizip-ng.cmake||' 'CMakeLists.txt'
	sed -i 's/find_package(minizip-ng 3.0.7 REQUIRED)/find_package(minizip-ng REQUIRED)/' 'share/cmake/modules/FindExtPackages.cmake'
	
	patch -p1 -i '../minizip-ng-4.patch'
	
	rm -f 'share/cmake/modules/Findyaml-cpp.cmake'
	sed -i 's|${CMAKE_CURRENT_LIST_DIR}/share/cmake/modules/Findyaml-cpp.cmake||' 'CMakeLists.txt'
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

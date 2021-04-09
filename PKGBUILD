# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-opencolorio-git
conflicts=("mingw-w64-opencolorio")
provides=("mingw-w64-opencolorio")
pkgver=1.0.8.r586.gbc88857f
pkgrel=1
pkgdesc="OpenColorIO (OCIO) is a complete color management solution geared towards motion picture production with an emphasis on visual effects and computer animation. (mingw-w64)"
arch=(any)
url="https://opencolorio.org/"
license=("BSD-3-Clause")
makedepends=('mingw-w64-cmake' 'git')
depends=(
	'mingw-w64-crt'
	'mingw-w64-yaml-cpp'
	'mingw-w64-lcms2'
	'mingw-w64-freeglut'
	'mingw-w64-glew'
	'mingw-w64-openexr')
options=('!strip' '!buildflags' 'staticlibs')
_repo="OpenColorIO"
source=("git+https://github.com/AcademySoftwareFoundation/${_repo}")
sha256sums=("SKIP")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
	cd "${_repo}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "${_repo}"
	sed -i -r "s/if\(Half_FOUND\)/if\(TARGET IlmBase::Half\)/" "share/cmake/modules/FindHalf.cmake"
	sed -i -r "s/if\(NOT WIN32\)/if\(NOT WIN32 OR MINGW\)/" "src/OpenColorIO/CMakeLists.txt"
	sed -i -r "s/if\(WIN32\)/if\(WIN32 AND NOT MINGW\)/" "src/OpenColorIO/CMakeLists.txt"
	for f in $(find "src/" -type f -name "*.cpp" -o -type f -name "*.h"); do sed -i -r 's/<Windows.h>/<windows.h>/' "$f"; done
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DOCIO_BUILD_APPS=OFF -DOCIO_USE_SSE=ON -DOCIO_BUILD_PYTHON=OFF 
		-DCMAKE_VISIBILITY_INLINES_HIDDEN=ON -DCMAKE_CXX_VISIBILITY_PRESET=hidden -DCMAKE_CXX_STANDARD=17
		-DOCIO_INLINES_HIDDEN=ON -DOCIO_BUILD_TESTS=OFF -DOCIO_BUILD_GPU_TESTS=OFF -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG -msse4.2" )
		
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_repo}" -B "build-${_arch}" "${_flags[@]}"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

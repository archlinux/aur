# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-opencolorio
pkgver=2.0.1
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
source=(
	"https://github.com/AcademySoftwareFoundation/${_repo}/archive/v${pkgver}.tar.gz"
	"opencolorio-openexr3.patch"
)
sha256sums=(
	'ff1397b4516fdecd75096d5b575d6a23771d0c876bbcfc7beb5a82af37adcdf9'
	'1b857e43fb4e3c048a88a00c379d1fd61c557a24a3f6a7d475daf588af8ea064'
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_dir="${_repo}-${pkgver}"

prepare() {
	cd "${_dir}"
	patch -p1 < "${srcdir}/opencolorio-openexr3.patch"
	sed -i -r "s/if\(Half_FOUND\)/if\(TARGET IlmBase::Half\)/" "share/cmake/modules/FindHalf.cmake"
	sed -i -r "s/if\(NOT WIN32\)/if\(NOT WIN32 OR MINGW\)/" "src/OpenColorIO/CMakeLists.txt"
	sed -i -r "s/if\(WIN32\)/if\(WIN32 AND NOT MINGW\)/" "src/OpenColorIO/CMakeLists.txt"
	for f in $(find "src/" -type f -name "*.cpp" -o -type f -name "*.h"); do sed -i -r 's/<Windows.h>/<windows.h>/' "$f"; done
}

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DOCIO_BUILD_APPS=OFF -DOCIO_USE_SSE=ON -DOCIO_BUILD_PYTHON=OFF 
		-DCMAKE_VISIBILITY_INLINES_HIDDEN=ON -DCMAKE_CXX_VISIBILITY_PRESET=hidden -DCMAKE_CXX_STANDARD=17 -DOCIO_INLINES_HIDDEN=ON
		-DOCIO_INLINES_HIDDEN=ON -DOCIO_BUILD_TESTS=OFF -DOCIO_BUILD_GPU_TESTS=OFF -DOCIO_INSTALL_EXT_PACKAGES=NONE
		-DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG -msse4.2" )
		
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_dir}" -B "build-${_arch}" "${_flags[@]}"
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

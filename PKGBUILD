# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=ptex
pkgname=mingw-w64-${_pkgname}
pkgver=2.5.1
pkgrel=1
pkgdesc='Per-Face Texture Mapping for Production Rendering (mingw-w64)'
url='http://ptex.us/'
license=('BSD-3-Clause')
depends=(
	'mingw-w64-zlib'
	'mingw-w64-libdeflate'
)
makedepends=('mingw-w64-cmake')
checkdepends=('mingw-w64-wine' 'dos2unix')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/wdas/${_pkgname}/archive/v${pkgver}.tar.gz"
)
sha256sums=('6b4b55f562a0f9492655fcb7686ecc335a2a4dacc1de9f9a057a32f3867a9d9e')

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG'
	-DCMAKE_CXX_STANDARD=20
	-DPTEX_SHA=$_commit_sha -DPTEX_VER=$pkgver )

prepare() {
	cd "${_srcdir}"
	find . -iname '*.cpp' -type f -o -iname '*.h' -type f -exec sed -i 's/<Windows.h>/<windows.h>/' '{}' \;
	sed -i 's/#if defined(_WIN32)/#if 0/' 'src/ptex/PtexInt.h'
	sed -i "s/std::endl/'\\\n'/" 'src/tests/rtest.cpp'
	sed -i 's/DESTINATION ${CMAKE_INSTALL_LIBDIR}//' 'src/ptex/CMakeLists.txt'
	sed -i 's/${CMAKE_COMMAND}/$ENV{ARCH_CMAKE}/' 'src/tests/CMakeLists.txt'
	sed -i 's/"${CMD}"/${CMAKE_CROSSCOMPILING_EMULATOR} ${CMD}/' 'src/tests/compare_test.cmake'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=OFF \
			-DPTEX_BUILD_STATIC_LIBS=ON -DPTEX_BUILD_SHARED_LIBS=ON
		cmake --build "build-${_arch}"
	done
}

check() {
	unix2dos "${_srcdir}/src/tests/rtestok.dat"
	unix2dos "${_srcdir}/src/tests/ftestok.dat"

	for _arch in ${_architectures}; do
		ARCH_CMAKE=${_arch}-cmake ${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=ON
		cmake --build "build-${_arch}"
		cmake --build "build-${_arch}" --target test
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		rm -rf "${pkgdir}/usr/${_arch}/share/doc"
		${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

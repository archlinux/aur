# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=spdlog
pkgname=mingw-w64-${_pkgname}
pkgver=1.9.1
pkgrel=1
pkgdesc='Very fast, header-only/compiled, C++ logging library (mingw-w64)'
url="https://github.com/gabime/${_pkgname}/"
license=('MIT')
depends=('mingw-w64-fmt')
makedepends=('mingw-w64-cmake')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
source=(
	"$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
	'9a452cfa24408baccc9b2bc2d421d68172a7630c99e9504a14754be840d31a62'
)

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG'
	-DSPDLOG_BUILD_BENCH=OFF -DSPDLOG_FMT_EXTERNAL=ON -DSPDLOG_BUILD_SHARED=ON -DCMAKE_CXX_STANDARD=20
	-DSPDLOG_WCHAR_FILENAMES=OFF -DSPDLOG_WCHAR_SUPPORT=OFF -DSPDLOG_ENABLE_PCH=ON )

prepare() {
	cd "${_srcdir}"
	find . -iname '*.cpp' -type f -exec sed -i 's/<Windows.h>/<windows.h>/' '{}' \;
	sed -i 's/COMMAND \${test_target}/COMMAND \${CMAKE_CROSSCOMPILING_EMULATOR} \${test_target}/' 'tests/CMakeLists.txt'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=OFF -DSPDLOG_BUILD_TESTS=OFF -DSPDLOG_BUILD_TESTS_HO=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		# Only compile-time tests enabled.
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=ON -DSPDLOG_BUILD_TESTS=OFF -DSPDLOG_BUILD_TESTS_HO=ON
		cmake --build "build-${_arch}"
		cp "build-${_arch}/libspdlog.dll" "build-${_arch}/tests/"
		cmake --build "build-${_arch}" --target test
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
	done
}

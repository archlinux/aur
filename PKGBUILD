# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=yamc
pkgname=mingw-w64-${_pkgname}-git
provides=("mingw-w64-${_pkgname}")
conflicts=("mingw-w64-${_pkgname}")
pkgver=r223.4e015a7
pkgrel=1
pkgdesc='C++ mutex (mutual exclusion primitive for multi-threading) collections. This is header-only, cross-platform, no external dependency C++11 library. (mingw-w64)'
url='https://github.com/yohhoy/yamc'
license=('MIT')
depends=()
makedepends=('mingw-w64-cmake' 'git')
checkdepends=('mingw-w64-gtest' 'mingw-w64-wine')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=('SKIP'
            '9e1582918e7ca6ece1ee4faba15403f649b51ab65a66453b3c643ad03dca1d76')
source=(
	"git+${url}.git"
	'yamc-test-fix.patch'
)

_dir="${_pkgname}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG' )

prepare() {
	cd "${_dir}"
	
	patch -uNp1 -i '../yamc-test-fix.patch'
	sed -i 's/set(CMAKE_CXX_STANDARD 11)/set(CMAKE_CXX_STANDARD 20)/' 'CMakeLists.txt'
	sed -i 's/set(CMAKE_CXX_STANDARD 11)/set(CMAKE_CXX_STANDARD 20)/' 'tests/CMakeLists.txt'
}

pkgver() {
	cd "${_dir}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_dir}" -B "build-${_arch}" "${_flags[@]}" -DENABLE_TESTING=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_dir}" -B "build-${_arch}" "${_flags[@]}" -DENABLE_TESTING=ON
		cmake --build "build-${_arch}"
		cmake --build "build-${_arch}" --target test
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		#${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin"/*.dll
	done
}

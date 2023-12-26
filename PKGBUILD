# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=range-v3
pkgname=mingw-w64-${_pkgname}-git
provides=("mingw-w64-${_pkgname}")
conflicts=("mingw-w64-${_pkgname}")
pkgver=0.12.0.r28.g97452bb
pkgrel=1
pkgdesc='Experimental range library for C++11/14/17 (mingw-w64)'
url="https://github.com/ericniebler/${_pkgname}"
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'git')
#checkdepends=('mingw-w64-wine')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=('SKIP')
source=("git+${url}.git")

_dir="${_pkgname}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG' \
         -DRANGES_CXX_STD=20 -DRANGE_V3_HEADER_CHECKS=OFF -DRANGE_V3_EXAMPLES=OFF -DRANGE_V3_PERF=OFF )

pkgver() {
	cd "${_dir}"
	( set -o pipefail
		git describe --tags --abbrev=7 --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_dir}" -B "build-${_arch}" "${_flags[@]}" -DRANGE_V3_TESTS=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_dir}" -B "build-${_arch}" "${_flags[@]}" -DRANGE_V3_TESTS=ON
		cmake --build "build-${_arch}"
		cmake --build "build-${_arch}" --target test
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		mv "${pkgdir}/usr/${_arch}/include/module.modulemap" "${pkgdir}/usr/${_arch}/include/range-v3.modulemap"
		#${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin"/*.dll
	done
}

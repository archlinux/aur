# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-fmt
pkgver=7.1.0
pkgrel=1
pkgdesc="{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams. (mingw-w64)"
url="https://fmt.dev/"
license=("MIT")
depends=("mingw-w64-crt")
makedepends=("mingw-w64-cmake")
arch=("any")
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=(
	"a53bce7e3b7ee8c7374723262a43356afff176b1684b86061748409e6f8b56c5"
)
source=(
	"https://github.com/fmtlib/fmt/archive/${pkgver}.tar.gz"
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" -DFMT_DOC=OFF -DFMT_TEST=OFF )
	
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "fmt-${pkgver}" -B "build-${_arch}" "${_flags[@]}"
		make -C "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
	done
}

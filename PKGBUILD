# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-fmt
pkgver=8.0.1
pkgrel=1
pkgdesc="Open-source formatting library for C++ (mingw-w64)"
url="https://fmt.dev/"
license=("MIT")
depends=("mingw-w64-crt")
makedepends=("mingw-w64-cmake")
checkdepends=('mingw-w64-wine')
arch=("any")
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=(
	"b06ca3130158c625848f3fb7418f235155a4d389b2abc3a6245fb01cb0eb1e01"
)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/fmtlib/fmt/archive/${pkgver}.tar.gz"
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O2 -DNDEBUG" -DFMT_DOC=OFF )

prepare() {
	cd "fmt-${pkgver}"
	#sed -i 's/class ostream final/class FMT_API ostream final/' 'include/fmt/os.h'
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "fmt-${pkgver}" -B "build-${_arch}" "${_flags[@]}" -DFMT_TEST=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "fmt-${pkgver}" -B "build-${_arch}" "${_flags[@]}" -DFMT_TEST=ON
		cmake --build "build-${_arch}"
		cmake --build "build-${_arch}" --target test
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
	done
}

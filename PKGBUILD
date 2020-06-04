# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-fmt
pkgver=6.2.1
pkgrel=1
pkgdesc="{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
url="https://fmt.dev/"
license=("MIT")
depends=("mingw-w64-crt")
builddepends=("mingw-w64-cmake")
arch=("any")
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=(
	"5edf8b0f32135ad5fafb3064de26d063571e95e8ae46829c2f4f4b52696bbff0"
)
source=(
	"https://github.com/fmtlib/fmt/archive/${pkgver}.tar.gz"
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "fmt-${pkgver}" -B "build-${_arch}" -DFMT_DOC=OFF -DFMT_TEST=OFF
		make -C "build-${_arch}"
		
		${_arch}-cmake -S "fmt-${pkgver}" -B "build-${_arch}-static" -DFMT_DOC=OFF -DFMT_TEST=OFF -DBUILD_SHARED_LIBS=FALSE
		make -C "build-${_arch}-static"
	done
}

package() {
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
		make DESTDIR="${pkgdir}" -C "build-${_arch}-static" install
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

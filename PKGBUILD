# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=mingw-w64-pystring
pkgver=1.1.3
pkgrel=1
pkgdesc="Pystring is a collection of C++ functions which match the interface and behavior of python's string class methods using std::string."
arch=(any)
url="https://github.com/imageworks/pystring"
license=("custom")
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=(
	"https://github.com/imageworks/pystring/archive/v${pkgver}.tar.gz"
	"BuildPystring.cmake")
sha256sums=(
	"358a56e756e701836b69a31c75d3d9d41c34d447cf7b3775bbd5620dcd3203d9"
	"1069e99aa9e546945e0f88bd4f2b06cbca8bb796843d7dc97fa428bafef60a05")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cp "BuildPystring.cmake" "pystring-${pkgver}/CMakeLists.txt"
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "pystring-${pkgver}" -B "build-${_arch}" -DCMAKE_BUILD_TYPE=Release
		make -C "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		make DESTDIR="${pkgdir}" -C "build-${_arch}" install
		install -Dm644 "pystring-${pkgver}/LICENSE" "$pkgdir/usr/${_arch}/share/licenses/$pkgname/LICENSE"
	done
}

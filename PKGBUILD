# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=pystring
pkgname=mingw-w64-${_pkgname}
pkgver=1.1.3
pkgrel=2
pkgdesc='C++ functions matching the interface and behavior of python string methods with std::string (mingw-w64)'
arch=(any)
url='https://github.com/imageworks/pystring'
license=('custom')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=(
	"$_pkgname-$pkgver.tar.gz::https://github.com/imageworks/pystring/archive/v${pkgver}.tar.gz"
	'BuildPystring.cmake')
sha256sums=(
	'358a56e756e701836b69a31c75d3d9d41c34d447cf7b3775bbd5620dcd3203d9'
	'1069e99aa9e546945e0f88bd4f2b06cbca8bb796843d7dc97fa428bafef60a05')

_srcdir="${_pkgname}-${pkgver}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG' )

prepare() {
	cp 'BuildPystring.cmake' "${_srcdir}/CMakeLists.txt"
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		install -Dm644 "${_srcdir}/LICENSE" "$pkgdir/usr/${_arch}/share/licenses/$pkgname/LICENSE"
	done
}

# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=svt-av1
pkgname=mingw-w64-${_pkgname}
pkgver=1.3.0
pkgrel=1
pkgdesc='AV1-compliant software encoder/decoder library (mingw-w64)'
url='https://gitlab.com/AOMediaCodec/SVT-AV1'
license=('BSD' 'custom: Alliance for Open Media Patent License 1.0')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=('f85fd13ef16880550e425797bdfdf1b0ba310c21d6b343f74ea79dd2fbb2336e')
source=(
	"$_pkgname-$pkgver.tar.gz::https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v1.3.0/SVT-AV1-v${pkgver}.tar.bz2"
)

_srcdir="SVT-AV1-v${pkgver}"
# 32 bits not supported
_architectures='x86_64-w64-mingw32'
_flags=(
	-Wno-dev
	-DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DCOMPILE_C_ONLY=ON )

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_SHARED_LIBS=OFF \
			-DBUILD_APPS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

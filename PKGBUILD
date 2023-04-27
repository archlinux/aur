# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=svt-av1
pkgname=mingw-w64-${_pkgname}
pkgver=1.5.0
pkgrel=1
pkgdesc='AV1-compliant software encoder/decoder library (mingw-w64)'
url='https://gitlab.com/AOMediaCodec/SVT-AV1'
license=('BSD' 'custom: Alliance for Open Media Patent License 1.0')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'yasm')
arch=('any')
options=(!strip !buildflags staticlibs)
optdepends=()
sha256sums=('a649b071906fb840df19fb0e2ec97c04fde82c8ed64dfb8662f625cb8bc6245e')
source=(
	"$_pkgname-$pkgver.tar.gz::https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v${pkgver}/SVT-AV1-v${pkgver}.tar.bz2"
)

_srcdir="SVT-AV1-v${pkgver}"
# 32 bits not supported
_architectures='x86_64-w64-mingw32'
_flags=(
	-Wno-dev
	-DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-DCOMPILE_C_ONLY=OFF
	-DENABLE_NASM=OFF )

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_SHARED_LIBS=OFF \
			-DBUILD_APPS=OFF \
			-DBUILD_TESTING=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=OFF
		cmake --build "build-${_arch}"
	done
}

#check() {
#	for _arch in ${_architectures}; do
#		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=ON -Dgtest_force_shared_crt=ON
#		cmake --build "build-${_arch}"
#		cmake --build "build-${_arch}" --target test
#	done
#}

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

# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: drakkan <nicola.murino at gmail dot com>

_pkgname=srt
pkgname=mingw-w64-$_pkgname
pkgver=1.5.7
pkgrel=1
pkgdesc="Secure Reliable Transport library (mingw-w64)"
url="https://www.srtalliance.org/"
arch=('any')
license=('MPL-2.0')
depends=('mingw-w64-openssl')
makedepends=('mingw-w64-cmake' 'ninja')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/Haivision/srt/archive/v${pkgver}.tar.gz")
sha256sums=('017cd1e437ef2073a4dd10ddf7b55e86bc3d6ebac0393d13bd22f6a57055d32b')

_srcdir="${_pkgname}-${pkgver}"
_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE='Release'
	-DCMAKE_C_FLAGS_RELEASE='-DNDEBUG'
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' )

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		find "${pkgdir}/usr/${_arch}" -name "*.exe" -exec ${_arch}-strip --strip-all {} \;
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

# vim:set ts=2 sw=2:

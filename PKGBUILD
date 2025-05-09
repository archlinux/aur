# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-crypto++
_pkgname=crypto++
pkgver=8.9.0
_srcver=${pkgver//./_}
pkgrel=1
pkgdesc="A free C++ class library of cryptographic schemes (mingw-w64)"
arch=('any')
url="https://www.cryptopp.com/"
license=('BSL-1.0')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake' 'ninja')
options=('!strip' '!buildflags' 'staticlibs')
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://github.com/weidai11/cryptopp/archive/refs/tags/CRYPTOPP_${_srcver}.tar.gz"
	"${_pkgname}-cmake-${pkgver}.tar.gz::https://github.com/abdes/cryptopp-cmake/archive/refs/tags/CRYPTOPP_${_srcver}.tar.gz"
)
sha256sums=('ab5174b9b5c6236588e15a1aa1aaecb6658cdbe09501c7981ac8db276a24d9ab'
            '191d69061c56602de1610ebf03b44dcf75636006e7e60ef8105bee6472ec0caf')

_srcdir="cryptopp-cmake-CRYPTOPP_${_srcver}"
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_flags=(
	-Wno-dev
	-DCMAKE_BUILD_TYPE=Release
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
)

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-DCRYPTOPP_SOURCES="${srcdir}/cryptopp-CRYPTOPP_${_srcver}"
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a

		rm "${pkgdir}/usr/${_arch}/bin/cryptest.exe"
    rm -rf "${pkgdir}/usr/${_arch}/share/cryptopp"
	done
}

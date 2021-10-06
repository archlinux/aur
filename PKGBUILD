# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: Cody Maloney <cmaloney@theoreticalchaos.com>

pkgname=mingw-w64-gtest
pkgver=1.11.0
pkgrel=1
pkgdesc='Google Test - C++ testing utility based on the xUnit framework (like JUnit) (mingw-w64)'
arch=('any')
url='https://github.com/google/googletest'
license=('custom:BSD3')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=(!buildflags staticlibs !strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/googletest/archive/release-${pkgver}.tar.gz")
sha512sums=('6fcc7827e4c4d95e3ae643dd65e6c4fc0e3d04e1778b84f6e06e390410fe3d18026c131d828d949d2f20dde6327d30ecee24dcd3ef919e21c91e010d149f3a28')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-O2 -DNDEBUG' )
_srcdir="googletest-release-${pkgver}"

build() {
	for _arch in "${_architectures[@]}"; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTING=OFF
		cmake --build "build-${_arch}"
	done
}

package() {
	for _arch in "${_architectures[@]}"; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a
		
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

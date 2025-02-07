# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: Cody Maloney <cmaloney@theoreticalchaos.com>

_pkgname=gtest
pkgname=mingw-w64-${_pkgname}
pkgver=1.16.0
pkgrel=1
pkgdesc='Google Test - C++ testing utility based on the xUnit framework (like JUnit) (mingw-w64)'
arch=('any')
url='https://github.com/google/googletest'
license=('custom:BSD3')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
#checkdepends=('mingw-w64-wine' 'python')
options=(!buildflags staticlibs !strip)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/google/googletest/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bec8dad2a5abbea8e9e5f0ceedd8c9dbdb8939e9f74785476b0948f21f5db5901018157e78387e106c6717326558d6642fc0e39379c62af57bf1205a9df8a18b')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')
_flags=( -Wno-dev -DCMAKE_BUILD_TYPE='Release'
	-DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-Dgtest_hide_internal_symbols=ON
	-Dgtest_force_shared_crt=ON )
_srcdir="googletest-${pkgver}"

prepare() {
	cd "${_srcdir}"

	#patch -p1 -i "${srcdir}/${pkgname}-python-test.patch"
	sed -i 's/COMMAND "$<TARGET_FILE:${name}>"/COMMAND ${name}/' 'googletest/cmake/internal_utils.cmake'
}

build() {
	for _arch in "${_architectures[@]}"; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" \
			-Dgtest_build_tests=OFF \
			-Dgmock_build_tests=OFF \
			-DBUILD_SHARED_LIBS=OFF \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"

		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" \
			-Dgtest_build_tests=OFF \
			-Dgmock_build_tests=OFF
		cmake --build "build-${_arch}"
	done
}

#check() {
#	for _arch in "${_architectures[@]}"; do
#		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -Dgtest_build_tests=ON -Dgmock_build_tests=ON
#		cmake --build "build-${_arch}"
#		cp -f "build-${_arch}/bin"/* "build-${_arch}/googletest"
#		cp -f "build-${_arch}/bin"/* "build-${_arch}/googlemock"
#		GTEST_EXECUTOR="/usr/bin/${_arch}-wine" cmake --build "build-${_arch}" --target test
#	done
#}

package() {
	for _arch in "${_architectures[@]}"; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a

		DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
	done
}

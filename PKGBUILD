# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>
# Contributor: Louis R. Marascio <lrm@fitnr.com>
# Contributor: Cody Maloney <cmaloney@theoreticalchaos.com>

_pkgname=gtest
pkgname=mingw-w64-${_pkgname}
pkgver=1.14.0
pkgrel=1
pkgdesc='Google Test - C++ testing utility based on the xUnit framework (like JUnit) (mingw-w64)'
arch=('any')
url='https://github.com/google/googletest'
license=('custom:BSD3')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
checkdepends=('mingw-w64-wine' 'mingw-w64-python')
options=(!buildflags staticlibs !strip)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/google/googletest/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('765c326ccc1b87a01027385e69238266e356361cd4ee3e18e3c9d137a5d11fa5d657c164d02dd1be8fe693c8e10f2b580588dbfa57d27f070e2750f50d3e662c')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')
_flags=(
	-Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
	-Dgtest_hide_internal_symbols=ON -Dgtest_force_shared_crt=ON )
_srcdir="googletest-${pkgver}"

prepare() {
	cd "${_srcdir}"
	
	sed -i 's/COMMAND "$<TARGET_FILE:${name}>"/COMMAND ${name}/' 'googletest/cmake/internal_utils.cmake'
}

build() {
	for _arch in "${_architectures[@]}"; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}-static" "${_flags[@]}" -Dgtest_build_tests=OFF -Dgmock_build_tests=OFF \
			-DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"
		
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -Dgtest_build_tests=OFF -Dgmock_build_tests=OFF
		cmake --build "build-${_arch}"
	done
}

check() {
	for _arch in "${_architectures[@]}"; do
		${_arch}-cmake -S "${_srcdir}" -B "build-${_arch}" "${_flags[@]}" -Dgtest_build_tests=ON -Dgmock_build_tests=ON \
			-DPython_EXECUTABLE="/usr/bin/${_arch}-python"
		cmake --build "build-${_arch}"
		cp -f "build-${_arch}/bin"/* "build-${_arch}/googletest"
		cp -f "build-${_arch}/bin"/* "build-${_arch}/googlemock"
		cmake --build "build-${_arch}" --target test
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

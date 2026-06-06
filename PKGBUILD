# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib-compiled
_pkgname='cpp-httplib'
pkgver=0.46.1
pkgrel=1
pkgdesc='A C++ HTTP/HTTPS server and client library (compiled version)'
arch=('x86_64' 'i686')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
provides=("cpp-httplib=$pkgver" 'libcpp-httplib.so')
conflicts=('cpp-httplib')
depends=('openssl>=3' 'zlib' 'brotli' 'zstd')
# Cmake minimum comes from module scan minimum, not the CMakeLists.txt
makedepends=('cmake>=3.28' 'python>=3' 'ninja>=1.11')
checkdepends=('gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('5133e3378b8b26c12e0634bb4782d3a5f6e98530149a3b2e54e18955ffd17e3997fd6196e6a4351d7ea1d4fa1826760418a92f9849b0b4a2d52308f6e0670b5d')
build() {
	mkdir -p "$srcdir/$_pkgname-$pkgver/build"
	cd "$srcdir/$_pkgname-$pkgver/build"
	# Cmake can't generate modules with Makefiles as of 2/12/2026
	# See https://cmake.org/cmake/help/latest/manual/cmake-cxxmodules.7.html#generator-support
	cmake -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DBUILD_SHARED_LIBS=ON \
		-DHTTPLIB_SHARED=ON \
		-DHTTPLIB_COMPILE=ON \
		-DHTTPLIB_REQUIRE_OPENSSL=ON \
		-DHTTPLIB_REQUIRE_ZLIB=ON \
		-DHTTPLIB_REQUIRE_BROTLI=ON \
		-DHTTPLIB_REQUIRE_ZSTD=ON \
		-DHTTPLIB_BUILD_MODULES=ON \
		-DHTTPLIB_TEST=$CHECKFUNC \
		-DCMAKE_INSTALL_PREFIX=/usr ..
	cmake --build .
}
check() {
	cd "$srcdir/$_pkgname-$pkgver/build"
	ctest
}
package() {
	cd "$srcdir/$_pkgname-$pkgver/build"
	DESTDIR="$pkgdir" cmake --build . --target install
}

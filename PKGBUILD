# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib-compiled
_pkgname='cpp-httplib'
pkgver=0.56.0
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
sha512sums=('3db42b77a96ae2f0e41c54c3897142f6c18fa237d85e6d173ea2e1ab238e77f6ac77134dcb80f6870697ef40bb68027b131b9d45823a41cedb86c677a01482b4')
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

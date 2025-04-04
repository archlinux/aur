# Maintainer: DownerCase <downercase8 (at) gmail (dot) com>

pkgname=fineftp-server
pkgver=1.5.1
pkgrel=1
pkgdesc="FineFTP is a minimal FTP server library for Windows and Unix flavors"
arch=('x86_64')
url="https://github.com/eclipse-ecal/fineftp-server"
license=('MIT')
depends=(
	gcc-libs
	glibc
)
makedepends=(
	asio
	cmake
	gtest
	curl
)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/eclipse-ecal/fineftp-server/archive/v$pkgver.tar.gz"
)
sha256sums=('93b0f9ef7007136be1ba83b3d80b059b79a361fe0af8bbadbf6df1bacfcf203e')

build() {
	local cmake_options=(
		-S "$pkgname-$pkgver"
		-B build
		-DCMAKE_BUILD_TYPE=None
		-DCMAKE_INSTALL_PREFIX=/usr
		-DBUILD_SHARED_LIBS=ON
		-DFINEFTP_SERVER_BUILD_SAMPLES=OFF
		-DFINEFTP_SERVER_BUILD_TESTS=ON
		-DFINEFTP_SERVER_USE_BUILTIN_ASIO=OFF
		-DFINEFTP_SERVER_USE_BUILTIN_GTEST=OFF
		-DCMAKE_MODULE_PATH="$(pwd)/$pkgname-$pkgver/thirdparty/asio-module"
		-Dasio_INCLUDE_DIR=/usr/include
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

check() {
	local ctest_flags=(
		--test-dir build
		# show the stdout and stderr when the test fails
		--output-on-failure
		# Tests cannot be run in parallel
		--parallel 1
	)
	ctest "${ctest_flags[@]}"
}

package() {
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: DownerCase <downercase8 (at) gmail (dot) com>

pkgname=ecaludp
pkgver=0.1.2
pkgrel=1
pkgdesc="UDP traffic implementation for eCAL"
arch=('x86_64')
url="https://github.com/eclipse-ecal/ecaludp"
license=('Apache-2.0')
depends=(
	asio
	gcc-libs
	glibc
)
makedepends=(
	cmake
	recycle
	gtest
)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/eclipse-ecal/ecaludp/archive/v$pkgver.tar.gz"
	"Findrecycle.cmake"
)
sha256sums=('960b743694ff712d1a23e8427ddd56e3e415003a991e2e4431093a81da6ff770'
            '1f45b144bf6c9813006633f1179fc489100c1a9f8105f73d4181da56bcf6b121')

build() {
	local cmake_options=(
		-S "$pkgname-$pkgver"
		-B build
		-DCMAKE_BUILD_TYPE=None
		-DCMAKE_INSTALL_PREFIX=/usr
		-DBUILD_SHARED_LIBS=ON
		-DECALUDP_ENABLE_NPCAP=OFF
		-DECALUDP_BUILD_SAMPLES=OFF
		-DECALUDP_BUILD_TESTS=ON
		# Disable vendored dependencies
		-DECALUDP_USE_BUILTIN_ASIO=OFF
		-DECALUDP_USE_BUILTIN_RECYCLE=OFF
		-DECALUDP_USE_BUILTIN_UDPCAP=OFF
		-DECALUDP_USE_BUILTIN_GTEST=OFF
		# Resolve asio and Recycle packages
		-DCMAKE_MODULE_PATH="$srcdir/$pkgname-$pkgver/thirdparty/asio-module;$srcdir/"
		-Dasio_INCLUDE_DIR=/usr/include/
	)
	cmake "${cmake_options[@]}"
	cmake --build build
}

check() {
	local ctest_flags=(
		--test-dir build
		# show the stdout and stderr when the test fails
		--output-on-failure
	)
	ctest "${ctest_flags[@]}"
}

package() {
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	DESTDIR="$pkgdir" cmake --install build
}

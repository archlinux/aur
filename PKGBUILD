# Maintainer: DownerCase <downercase8 (at) gmail (dot) com>

pkgname=tcp_pubsub
pkgver=2.0.1
pkgrel=1
pkgdesc="TCP based publish-subscribe library for C++"
arch=('x86_64')
url="https://github.com/eclipse-ecal/tcp_pubsub"
license=('MIT')
depends=(
	gcc-libs
	glibc
)
makedepends=(
	asio
	cmake
	recycle
	gtest
)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/eclipse-ecal/tcp_pubsub/archive/v$pkgver.tar.gz"
	"Findrecycle.cmake"
)
sha256sums=('5631a65534073fbcef8e241bb0fffff9e88be54481c624a1c5a9ecf7d5b80a03'
            '1f45b144bf6c9813006633f1179fc489100c1a9f8105f73d4181da56bcf6b121')

build() {
	local cmake_options=(
		-S "$pkgname-$pkgver"
		-B build
		-DCMAKE_BUILD_TYPE=None
		-DCMAKE_INSTALL_PREFIX=/usr
		-DBUILD_SHARED_LIBS=ON
		-DTCP_PUBSUB_BUILD_SAMPLES=OFF
		-DTCP_PUBSUB_BUILD_TESTS=ON
		-DTCP_PUBSUB_USE_BUILTIN_ASIO=OFF
		-DTCP_PUBSUB_USE_BUILTIN_RECYCLE=OFF
		-DTCP_PUBSUB_USE_BUILTIN_GTEST=OFF
		-DCMAKE_MODULE_PATH="$(pwd)/$pkgname-$pkgver/thirdparty/asio/Module;$(pwd)/"
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

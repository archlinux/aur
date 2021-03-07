# Maintainer: soloturn@gmail.com
# Contributor: Adrian Perez de Castro <aperez@igalia.com>

_basename=libdispatch
pkgname="$_basename-git"
pkgver=2021.03.05.a.r0.g34f383d
pkgrel=1
pkgdesc="Support for concurrent code execution on multicore hardware, includes libblocksruntime"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://apple.github.io/swift-corelibs-libdispatch/"
license=(Apache)
makedepends=(git clang cmake)
provides=($_basename)
conflicts=($_basename swift swift-development)
source=(
	"$pkgname::git+https://github.com/apple/swift-corelibs-libdispatch.git"
	remove-werror.patch
)
sha512sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/^swift-DEVELOPMENT-SNAPSHOT-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$pkgname"
	patch -p0 < "${srcdir}/remove-werror.patch"
}

build() {
	CC=clang CXX=clang++ cmake -S"${pkgname}" -Bbuild \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBlocksRuntime_INCLUDE_DIR=/usr/include \
		-DBlocksRuntime_LIBRARIES=/usr/lib/libBlocksRuntime.so
	cmake --build build -j $(nproc)
}

check() {
	cmake --build build --target test
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}

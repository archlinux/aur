# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=libdispatch
pkgver=5.1.4
pkgrel=1
pkgdesc='Comprehensive support for concurrent code execution on multicore hardware'
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url=https://apple.github.io/swift-corelibs-libdispatch
license=(Apache)
depends=(libblocksruntime)
makedepends=(git clang cmake)
conflicts=(libdispatch-git swift swift-development)
source=("${pkgname}::git+https://github.com/apple/swift-corelibs-libdispatch.git#tag=swift-${pkgver}-RELEASE"
        system-blocksruntime.patch)
sha512sums=(SKIP
            '2a7950849d4244308674b997d07dd088c534acdc3d9229354257270177703fdaaaa39a65885c8550fd98d0d3fcaea569a539a46c4bc465f9a8c6ad26244170fc')

prepare () {
	cd "${pkgname}"
	patch -p1 < "${srcdir}/system-blocksruntime.patch"
}

build () {
	rm -rf _build
	mkdir _build
	cd _build
	CC=clang CXX=clang++ cmake \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBlocksRuntime_INCLUDE_DIR=/usr/include \
		-DBlocksRuntime_LIBRARIES=/usr/lib/libBlocksRuntime.so \
		"../${pkgname}"
	cmake --build . -j $(nproc)
}

check () {
	cmake --build _build --target test
}

package () {
	DESTDIR="${pkgdir}" cmake --install _build
}

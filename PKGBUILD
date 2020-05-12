# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=libdispatch
pkgver=5.2.3
pkgrel=1
pkgdesc='Comprehensive support for concurrent code execution on multicore hardware'
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url=https://apple.github.io/swift-corelibs-libdispatch
license=(Apache)
depends=(libblocksruntime)
makedepends=(git clang cmake)
conflicts=(libdispatch-git swift swift-development)
source=("${pkgname}::git+https://github.com/apple/swift-corelibs-libdispatch.git#tag=swift-${pkgver}-RELEASE"
        remove-werror.patch
        system-blocksruntime.patch)
sha512sums=('SKIP'
            'd7d05ff6fa2ece40fea51e97f1af04e25ae9c2b55246fa2d753c446cff380262e611f9abb5112b7c7c94730362f0d06e0ccd867477c9470d1154e9c65e540529'
            '01e5a11696390678fa0f327f21112d9373e54f4b7bf28a8a60a3ede40d2561fe061eae746d5c997a380226149dc76008c3b1fec8a799af96f1152c4a97500803')

prepare () {
	cd "${pkgname}"
	patch -p0 < "${srcdir}/remove-werror.patch"
	patch -p0 < "${srcdir}/system-blocksruntime.patch"
}

build () {
	CC=clang CXX=clang++ cmake -S"${pkgname}" -Bbuild \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBlocksRuntime_INCLUDE_DIR=/usr/include \
		-DBlocksRuntime_LIBRARIES=/usr/lib/libBlocksRuntime.so
	cmake --build build -j $(nproc)
}

check () {
	cmake --build build --target test
}

package () {
	DESTDIR="${pkgdir}" cmake --install build
}

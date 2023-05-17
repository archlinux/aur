# Maintainer: Paul Pan <i [at] 0x7f [dot] app>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=wasm-micro-runtime-git
_pkg="${pkgname%-git}"
pkgver=1.2.2.r2.gd6928784
pkgrel=1
pkgdesc="Standalone WebAssembly (WASM) runtime with small footprint"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasm-micro-runtime"
license=('Apache')
depends=('glibc' 'llvm-libs')
makedepends=('cmake' 'git' 'llvm')
provides=("wasm-micro-runtime")
conflicts=("wasm-micro-runtime")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^WAMR-//;s/-/.r/;s/-/./'
}

build() {
	cmake \
		-B build \
		-S "$_pkg/product-mini/platforms/linux" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DWAMR_BUILD_MULTI_MODULE=1 \
		-DWAMR_BUILD_SHARED_MEMORY=1 \
		-DWAMR_BUILD_BULK_MEMORY=1 \
		-DWAMR_BUILD_THREAD_MGR=1 \
		-DWAMR_BUILD_LIB_PTHREAD=1 \
		-DWAMR_BUILD_LIB_PTHREAD_SEMAPHORE=1 \
		-DWAMR_BUILD_LIB_WASI_THREADS=1 \
		-DWAMR_BUILD_TAIL_CALL=1 \
		-DWAMR_BUILD_SIMD=1 \
		-DWAMR_BUILD_REF_TYPES=1 \
		-Wno-dev
	cmake \
		-B build-lib \
		-S "$_pkg" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DWAMR_BUILD_MULTI_MODULE=1 \
		-DWAMR_BUILD_SHARED_MEMORY=1 \
		-DWAMR_BUILD_BULK_MEMORY=1 \
		-DWAMR_BUILD_THREAD_MGR=1 \
		-DWAMR_BUILD_LIB_PTHREAD=1 \
		-DWAMR_BUILD_LIB_PTHREAD_SEMAPHORE=1 \
		-DWAMR_BUILD_LIB_WASI_THREADS=1 \
		-DWAMR_BUILD_TAIL_CALL=1 \
		-DWAMR_BUILD_SIMD=1 \
		-DWAMR_BUILD_REF_TYPES=1 \
		-Wno-dev
	cmake \
		-B build-compiler \
		-S "$_pkg/wamr-compiler" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DWAMR_BUILD_WITH_CUSTOM_LLVM=1 \
		-Wno-dev
	cmake --build build -j8
	cmake --build build-lib -j8
	cmake --build build-compiler -j8
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	DESTDIR="${pkgdir}" cmake --install build-lib
	DESTDIR="${pkgdir}" cmake --install build-compiler
}

# Maintainer: Paul Pan <i [at] 0x7f [dot] app>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=wasm-micro-runtime
pkgver=1.2.2
pkgrel=1
pkgdesc="Standalone WebAssembly (WASM) runtime with small footprint"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasm-micro-runtime"
license=('Apache')
depends=('glibc' 'llvm-libs')
makedepends=('cmake' 'llvm')
provides=("wasm-micro-runtime")
conflicts=("wasm-micro-runtime-git")
changelog="RELEASE_NOTES.md"
source=("$pkgname-$pkgver.tar.gz::$url/archive/WAMR-$pkgver.tar.gz")
sha512sums=('13b995ccca0ebc183df943a5fa47a8aa25361cca4081e8fa5316732979e89e4e289a6ff43955617f5fb271f31a3a9e511dec0815c53dd7c058eed958d0a2ac7d')

build() {
	cmake \
		-B build \
		-S "$pkgname-WAMR-$pkgver/product-mini/platforms/linux" \
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
		-S "$pkgname-WAMR-$pkgver" \
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
		-S "$pkgname-WAMR-$pkgver/wamr-compiler" \
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

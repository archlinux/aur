# Maintainer: Paul Pan <i [at] 0x7f [dot] app>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=wasm-micro-runtime-git
_pkg="${pkgname%-git}"
pkgver=1.2.3.r0.gfa2f29fd
pkgrel=1
pkgdesc="Standalone WebAssembly (WASM) runtime with small footprint"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasm-micro-runtime"
license=('Apache')
depends=('glibc' 'llvm-libs')
makedepends=('cmake' 'git' 'llvm' 'ninja')
provides=("wasm-micro-runtime")
conflicts=("wasm-micro-runtime")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^WAMR-//;s/-/.r/;s/-/./'
	sed -i 's/${LLVM_AVAILABLE_LIBS}/LLVM/g' "$_pkg/product-mini/platforms/linux/CMakeLists.txt"
}

build() {
	configure_arguments=" \
		-GNinja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DLLVM_DIR=/usr/lib/cmake/llvm \
		-DWAMR_BUILD_PLATFORM=linux \
		-DWAMR_BUILD_TARGET=X86_64 \
		-DWAMR_BUILD_INTERP=1 \
		-DWAMR_BUILD_FAST_INTERP=1 \
		-DWAMR_BUILD_AOT=1 \
		-DWAMR_BUILD_JIT=1 \
		-DWAMR_BUILD_FAST_JIT=1 \
		-DWAMR_BUILD_LIBC_BUILTIN=1 \
		-DWAMR_BUILD_LIBC_WASI=1 \
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
	"

	cmake \
		-B build \
		-S "$_pkg/product-mini/platforms/linux" \
		$configure_arguments

	cmake \
		-B build-lib \
		-S "$_pkg" \
		$configure_arguments

	cmake \
		-B build-compiler \
		-S "$_pkg/wamr-compiler" \
		-GNinja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DWAMR_BUILD_WITH_CUSTOM_LLVM=1

	cmake --build build
	cmake --build build-lib
	cmake --build build-compiler
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	DESTDIR="${pkgdir}" cmake --install build-lib
	DESTDIR="${pkgdir}" cmake --install build-compiler
}

#  Maintainer: ToKiNoBug <tokinobug@163.com>
_pkgname=slopecraft
pkgname=${_pkgname}
pkgver=5.4.1
pkgrel=0
pkgdesc="Map Pixel Art Generator for Minecraft"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/SlopeCraft/SlopeCraft"
license=('GPL3')
options=(!debug)
makedepends=(
	'clang' 'lld' 'cmake' 'ninja' 'git' # build tools
	'vulkan-tools' '7zip' 'glslang' # tools
	'eigen' 'xsimd' 'qt6-tools' 'cereal' 'boost' 'cli11' 'vulkan-headers' # header only libs
)
depends=(
	'libpng'
	'libzip'
	'zlib'
	'zstd'
	'qt6-base'
	'openmp'
	'boost-libs'
	'vulkan-icd-loader'
)
optdepends=(
	'vulkan-radeon: AMD GPU acceleration'
	'vulkan-intel: Intel GPU acceleration'
	'nvidia-utils: Nvidia GPU acceleration'
)
source=(https://github.com/SlopeCraft/SlopeCraft/archive/refs/tags/v5.4.1.tar.gz)
b2sums=('f8831da0d474d11c0ae7c8f49484719bd45c442a8ea84d426c314021efb385d538347ceff97b0fb2914286931a1f6c0b6bf5e7dffdb6783610fb903feb625aa8')

# STRONGLY suggested to use clang and lld because it's cool. Widely tested under linux+clang
build() {
	cmake -S SlopeCraft-$pkgver -B build \
		-G Ninja \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_LINKER_TYPE=LLD \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSlopeCraft_vectorize=ON \
		-DSlopeCraft_GPU_API="Vulkan"

	cmake --build build --parallel
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

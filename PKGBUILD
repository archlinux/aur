#  Maintainer: ToKiNoBug <tokinobug@163.com>
_pkgname=slopecraft
pkgname=${_pkgname}
pkgver=5.5.2
pkgrel=1
pkgdesc="Map Pixel Art Generator for Minecraft"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/SlopeCraft/SlopeCraft"
license=('GPL-3.0-only')
options=(!debug)
makedepends=(
	'clang' 'lld' 'cmake' 'ninja' 'git' 'llvm' # build tools
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
	'mc-schem' # From AUR
)
optdepends=(
	'vulkan-radeon: AMD GPU acceleration'
	'vulkan-intel: Intel GPU acceleration'
	'nvidia-utils: Nvidia GPU acceleration'
)
source=(https://github.com/SlopeCraft/SlopeCraft/archive/refs/tags/v5.5.2.tar.gz)
sha512sums=('16719bf39201984ae32c509cc2f90820184d8683de649e3f82df0ed407f4fcfe30370544137af328cfb051b3c901df662b813e45faa0aa8c2e2fdde4761f2659')

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
	rm $pkgdir/usr/lib/libmc_schem.so
}

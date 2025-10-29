#  Maintainer: ToKiNoBug <tokinobug@163.com>
_pkgname=slopecraft
pkgname=${_pkgname}
pkgver=5.3.2
pkgrel=0
pkgdesc="Map Pixel Art Generator for Minecraft"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/SlopeCraft/SlopeCraft"
license=('GPL3')
makedepends=('clang' 'cmake' 'ninja' 'eigen' 'git' 'xsimd' 'qt6-tools' 'opencl-headers' 'opencl-clhpp' 'cereal' 'boost' 'tl-expected' 'cli11')
depends=('gcc-libs' 'glibc' 'fmt' 'libpng' 'libzip' 'zlib' 'zstd' 'qt6-base' 'openmp' 'ocl-icd' 'boost-libs')
optdepends=('opencl-nvidia: nvidia GPU boosting',
            'intel-compute-runtime: Intel GPU boosting',
            'rocm-opencl-runtime: AMD GPU boosting',
            'opencl-clover-mesa: GPU boosting with mesa')
source=(https://github.com/SlopeCraft/SlopeCraft/archive/refs/tags/v5.3.2.tar.gz)
b2sums=('5d46bb45b37deb629f6219988c633c392113b982bbfc2ed3aecff8a1f841e7540020048ffaaa74f7a0e9bfca4853848247ec6587ef4c60be47b98c02c53c1be0')

build() {
	cmake -S SlopeCraft-$pkgver -B build \
		-G Ninja \
		-DCMAKE_C_COMPILER=clang \
		-DCMAKE_CXX_COMPILER=clang++ \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSlopeCraft_vectorize=ON \
		-DSlopeCraft_GPU_API="OpenCL"

	cmake --build build --parallel
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	
	cd "$pkgdir/usr"
	rm README.md
	rm README-en.md
	rm LICENSE
	rm LICENSE-zh.md
}

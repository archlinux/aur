#  Maintainer: ToKiNoBug <tokinobug@163.com>
_pkgname=slopecraft
pkgname=${_pkgname}
pkgver=5.2.2
pkgrel=2
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
source=(https://github.com/SlopeCraft/SlopeCraft/archive/refs/tags/v5.2.2.tar.gz)
b2sums=('0a56d0f7210ceca98bfea0547f50d68684f68bf58c3fe83f9ed6c0b5418f8709439b6c845878bb35517393a95e9b204792ce14c4289feb66877dd39da6724107')

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

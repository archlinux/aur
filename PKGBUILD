# Maintainer: Inc44
pkgname=libbsc-cuda
pkgver=3.4.0
pkgrel=1
pkgdesc="High-performance block-sorting data compressor with CUDA"
arch=(x86_64)
url=https://github.com/IlyaGrebnov/libbsc
license=(Apache-2.0)
depends=(
	cuda
	gcc-libs
	glibc
)
makedepends=(
	cccl
	cmake
	git
)
optdepends=('nvidia-utils: CUDA support for NVIDIA GPUs')
provides=("libbsc=$pkgver")
conflicts=(libbsc)
source=("git+$url.git#tag=v$pkgver")
sha256sums=(d2595f2bb2f34b46fd11407e8010910da201e7a5c59083575a3e911db7fd59a6)

build() {
	cd "$srcdir/libbsc"
	cmake -S . -B build \
		-DCMAKE_C_COMPILER=gcc \
		-DCMAKE_CXX_COMPILER=g++ \
		-DCMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBSC_ENABLE_CUDA=ON
	cmake --build build
}

package() {
	cd "$srcdir/libbsc"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgname=ggml-cuda-12.9
pkgver=0.29.0
pkgrel=1
pkgdesc="ggml CUDA backend built against CUDA 12.9 for Maxwell/Pascal/Volta GPUs (sm_50–sm_70)"
arch=(x86_64)
url="https://github.com/ggml-org/ggml"
license=(MIT)
depends=(ggml=$pkgver cuda-12.9 gcc-libs glibc)
makedepends=(cmake ninja gcc14)
provides=(ggml-cuda)
conflicts=(ggml-cuda)
source=("ggml-$pkgver.tar.gz::https://github.com/ggml-org/ggml/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b08d30d6685c5c90908e38dc279439fcc662b3b3f5a38c7bb2b447a31642c0f6')

build() {
  export PATH=/opt/cuda/bin:$PATH
  cmake -S "ggml-$pkgver" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DGGML_BACKEND_DL=ON \
    -DGGML_NATIVE=OFF \
    -DGGML_CUDA=ON \
    -DCMAKE_CUDA_ARCHITECTURES="50-real;52-real;60-real;61-real;70-real" \
    -DCUDAToolkit_ROOT=/opt/cuda \
    -DCMAKE_CUDA_HOST_COMPILER=/usr/bin/g++-14 \
    -DGGML_CUDA_NCCL=OFF \
    -DCMAKE_SKIP_RPATH=ON
  cmake --build build --target ggml-cuda
}

package() {
  local lib
  lib=$(find "$srcdir/build" -name 'libggml-cuda.so' | head -1)
  install -Dm755 "$lib" "$pkgdir/usr/lib/ggml/libggml-cuda.so"
  install -Dm644 "ggml-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

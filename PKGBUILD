pkgname=darknet-hankai-git
pkgver=4.0
pkgrel=1
pkgdesc="Darknet: neural network framework for object detection"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/hank-ai/darknet"
license=('Apache-2.0')
depends=('opencv' 'qt6-base')
makedepends=('cmake' 'git')
optdepends=(
  'cuda: for NVIDIA GPU support'
  'cudnn: for NVIDIA cuDNN acceleration'
  'rocm-hip-runtime: for AMD GPU support'
  'rocm-hip-sdk: for AMD GPU development'
  'amdsmi: for AMD GPU monitoring'
>>>>>>> fccdcf6 (Fix CUDA/ROCm detection and Qt6 dependencies)
)
source=("git+https://github.com/hank-ai/darknet.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/darknet"
  git describe --tags --abbrev=0 | sed 's/^v//'
}

prepare() {
  cd "$srcdir/darknet"
  mkdir -p build
}

build() {
  cd "$srcdir/darknet/build"
  
  # Remove problematic compiler flags for ROCm
  export CFLAGS="${CFLAGS// -fcf-protection/}"
  export CXXFLAGS="${CXXFLAGS// -fcf-protection/}"
  
  # Check for GPU support and configure accordingly
  if command -v nvcc &> /dev/null && lspci | grep -qi nvidia; then
    # NVIDIA GPU detected
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc \
          ..
  elif [[ -d /opt/rocm ]] && lspci | grep -qi amd; then
    # AMD GPU detected
    local gpu_arch="gfx1100"
    if lspci | grep -qi "radeon rx 6"; then
      gpu_arch="gfx1030"
    fi
    
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_HIP_COMPILER=/opt/rocm/lib/llvm/bin/clang \
          -DCMAKE_HIP_COMPILER_ROCM_ROOT=/opt/rocm \
          -DDARKNET_TRY_CUDA=OFF \
          -DCMAKE_HIP_ARCHITECTURES="$gpu_arch" \
          ..
  else
    # CPU only
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          ..
  fi
  
  make -j"$(nproc)"
}

package() {
  cd "$srcdir/darknet/build"
  make DESTDIR="$pkgdir" install
}

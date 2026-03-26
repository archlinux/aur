# # Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

pkgname=llama.cpp-aio
_pkgname=${pkgname%%-aio}
pkgver=b8530
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (All in one: CUDA + ROCm + Vulkan)"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  python
  cuda
  nvidia-utils
  hip-runtime-amd
  hipblas
  openmp
  rocblas
  vulkan-icd-loader
)
makedepends=(
  cmake
  git
  rocm-hip-sdk
  shaderc
  vulkan-headers
)
optdepends=(
  'python-numpy: needed for convert_hf_to_gguf.py'
  'python-safetensors: needed for convert_hf_to_gguf.py'
  'python-sentencepiece: needed for convert_hf_to_gguf.py'
  'python-pytorch: needed for convert_hf_to_gguf.py'
  'python-transformers: needed for convert_hf_to_gguf.py'
  'python-gguf: needed for convert_hf_to_gguf.py'
)
provides=(${_pkgname} ${_pkgname}-cuda ${_pkgname}-hip ${_pkgname}-vulkan)
conflicts=(${_pkgname} libggml ggml stable-diffusion.cpp)
options=(lto !debug)
backup=("etc/conf.d/llama.cpp")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/${pkgver}.tar.gz"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.service"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.conf"
)
sha256sums=('c65827ed3d616a9309526bbe233485a61a0634bc9b1a8586549318090139869d'
            '0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d'
            'e4856f186f69cd5dbfcc4edec9f6b6bd08e923bceedd8622eeae1a2595beb2ec')

prepare() {
  ln -sf "${_pkgname}-${pkgver}" llama.cpp
}

build() {
  # 配置环境
  if [[ -z "${NVCC_CCBIN}" ]]; then
    source /etc/profile
  fi
  if [[ -z "${ROCM_PATH}" ]]; then
    source /etc/profile
  fi
  export HIP_PATH="$(hipconfig -R)"
  export HIPCXX="$(hipconfig -l)/clang"
  export HIP_PLATFORM=amd

  local _cmake_options=(
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_HIP_FLAGS="-mllvm --amdgpu-unroll-threshold-local=600" # 修复 ROCm 性能问题
    -DBUILD_SHARED_LIBS=ON
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_USE_SYSTEM_GGML=OFF
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_BUILD_TESTS=OFF
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    # CUDA part
    -DGGML_CUDA=ON
    -DGGML_CUDA_GRAPHS=ON
    # ROCm part
    -DGGML_HIP=ON
    -DGGML_HIP_GRAPHS=ON
    # -DGGML_HIP_ROCWMMA_FATTN=ON # 对线性注意力优化
    -DHIP_PLATFORM=amd # 手动指定 AMD 平台, 防止因 rocm-nightly 禁用自动检测而报错
    # Vulkan part
    -DGGML_VULKAN=ON

    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DLLAMA_BUILD_NUMBER="${pkgver#b}" # 修正版本号
    -Wno-dev
  )

  # 检查是否在 CI 环境中构建
  if [ -n "$CI" ] && [ "$CI" != 0 ]; then
    msg2 "CI = $CI detected, building universal package"
    # 启用通用构建
    _cmake_options+=(
      -DGGML_BACKEND_DL=ON
      -DGGML_CPU_ALL_VARIANTS=ON
      -DGGML_NATIVE=OFF

      # https://developer.nvidia.com/cuda-gpus
      -DCMAKE_CUDA_ARCHITECTURES="75;86;89;120;121"

      # https://llvm.org/docs/AMDGPUUsage.html
      # gfx906: MI 50/60, Radeon VII
      # gfx101x: RX 5000 Series
      # gfx103x: RX 6000 Series
      # gfx110x: RX 7000 Series
      # gfx1151: Strix Halo
      # gfx120x: RX 9000 Series
      -DAMDGPU_TARGETS="gfx906;gfx1010;gfx1030;gfx1031;gfx1100;gfx1101;gfx1102;gfx1151;gfx1200;gfx1201"
      -DGGML_ZENDNN=ON
    )
  else
    # 本地构建, 针对当前设备优化
    _cmake_options+=(
      -DGGML_NATIVE=ON
    )
  fi

  # 允许用户自定义构建选项
  if [[ -n "$LLAMA_BUILD_EXTRA_ARGS" ]]; then
    msg2 "Applied custom CMake build args: $LLAMA_BUILD_EXTRA_ARGS"
    _cmake_options+=($LLAMA_BUILD_EXTRA_ARGS)
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build -- -j $(nproc)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"

  msg2 "llama.cpp.service is now available"
  msg2 "llama-server arguments are in /etc/conf.d/llama.cpp"
}

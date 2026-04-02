# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

pkgname=llama.cpp-hip-gfx1151
_pkgname=llama.cpp
pkgver=b8611
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (with AMD ROCm optimizations)"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  hip-runtime-amd
  hipblas
  openmp
  python
  rocblas
)
makedepends=(
  cmake
  git
  rocm-hip-sdk
)
optdepends=(
  'python-numpy: needed for convert_hf_to_gguf.py'
  'python-safetensors: needed for convert_hf_to_gguf.py'
  'python-sentencepiece: needed for convert_hf_to_gguf.py'
  'python-pytorch: needed for convert_hf_to_gguf.py'
  'python-transformers: needed for convert_hf_to_gguf.py'
  'python-gguf: needed for convert_hf_to_gguf.py'
)
provides=(llama.cpp-hip ${_pkgname})
conflicts=(llama.cpp-hip ${_pkgname} libggml ggml stable-diffusion.cpp)
options=(lto !debug)
backup=("etc/conf.d/llama.cpp")
source=(
  "llama.cpp-hip-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/${pkgver}.tar.gz"
  # https://patch-diff.githubusercontent.com/raw/ggml-org/llama.cpp/pull/19493.patch?full_index=1
  "llama-pr-19493-b8611-8491e154.diff::https://github.com/ggml-org/llama.cpp/compare/d43375ff7f73e5098837c20512aa58f4bc8edb02...8491e1540533db40bba9d57fc8c2cdecc49b60d0.diff"
  # https://gist.githubusercontent.com/pedapudi/183f337e687630a43eacb293e157c9bd/raw
  "llama-gfx1151-41ebffac.patch::https://gist.githubusercontent.com/pedapudi/183f337e687630a43eacb293e157c9bd/raw/41ebffac35c984b8a9431870f0041602d3217599/gistfile1.txt"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.service"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.conf"
)
sha256sums=('946d3ea4d70af3c51fcbab37197da8b0d696740da6dd2afe184ab185f2ccf16a'
            'f335d90ea928607726b6d0b6246821c755436e3929e7da9e94d0b33f127e4dfe'
            '66729416becca06aa006ab7cc4bd945888ff84ea49f273693c47fe69ac9965ee'
            '0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d'
            'e4856f186f69cd5dbfcc4edec9f6b6bd08e923bceedd8622eeae1a2595beb2ec')

prepare() {
  ln -sf "${_pkgname}-${pkgver}" llama.cpp

  patch -d "${srcdir}/llama.cpp" -Np1 -i "${srcdir}/llama-pr-19493-b8611-8491e154.diff"
  patch -d "${srcdir}/llama.cpp" -Np1 -i "${srcdir}/llama-gfx1151-41ebffac.patch"
}

build() {
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
    -DGGML_HIP=ON
    -DGGML_HIP_GRAPHS=ON
    -DAMDGPU_TARGETS="gfx1151"
    # -DGGML_HIP_ROCWMMA_FATTN=ON # 对线性注意力优化
    -DHIP_PLATFORM=amd # 手动指定 AMD 平台, 防止因 rocm-nightly 禁用自动检测而报错
    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DLLAMA_BUILD_NUMBER="${pkgver#b}" # 修正版本号
    -Wno-dev
  )

  # 检查是否在 CI 环境中构建
  if [ -n "$CI" ] && [ "$CI" != 0 ]; then
    msg2 "CI = $CI detected, building gfx1151 package"
    _cmake_options+=(
      -DGGML_BACKEND_DL=ON
      -DGGML_CPU_ALL_VARIANTS=ON
      -DGGML_NATIVE=OFF
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

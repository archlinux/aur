# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributer: darkbasic <niccolo.belli@linuxsystems.it>

pkgname=llama.cpp-gfx1151
_pkgname=${pkgname%%-gfx1151}
pkgver=b10705
pkgrel=2
pkgdesc="Port of Facebook's LLaMA model in C/C++ (Optimized for gfx1151, ROCm + Vulkan)"
arch=(x86_64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  python
  openmp
  hip-runtime-amd
  hipblas
  rocblas
  vulkan-icd-loader
)
makedepends=(
  cmake
  git
  nodejs
  npm
  shaderc
  vulkan-headers
  spirv-headers
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
provides=(${_pkgname} ${_pkgname}-hip ${_pkgname}-vulkan llama-cpp libggml ggml ggml-rocm ggml-vulkan)
conflicts=(${_pkgname} ${_pkgname}-hip ${_pkgname}-vulkan llama-cpp libggml ggml ggml-rocm ggml-vulkan stable-diffusion.cpp)
options=(lto !debug)
backup=("etc/conf.d/llama.cpp")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/${pkgver}.tar.gz"
  # 提升性能的妙妙工具
  # "llama-gfx1151.patch::https://gist.githubusercontent.com/pedapudi/0da060d2a3b49a51155dbf00db61fea0/raw/aaaee0a96656ec0fc49bdfa76acd2b4edbfcbfb9/gistfile1.txt"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.service"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.conf"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.sysusers"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.tmpfiles"
)
sha256sums=('88b388d1970313f4bef517012beadb9b579741b37547f6b3fdbedfaf70bf8a9a'
            'b481dcaa07d8b912b32066da4ee48341cb521852eb16d76a6cf7a8216402e101'
            'bd43b307d55a74bc64b88d95e1f37d0b12ddd2935563fc893835a91e2b8c10b5'
            '8349878d7e61819fe3da6e8a25c46c7dd66592c9a5736a7f66eb475c7a51068c'
            '027600188395ed3d721ed6f32c6fa954138fb25212154ceeadc2ff16076b1194')


prepare() {
  ln -sf "${_pkgname}-${pkgver}" llama.cpp

  # Tailwind v4's oxide scanner walks up looking for the nearest .git to anchor
  # .gitignore lookup. In AUR helpers (yay/paru) the parent .git is the AUR
  # clone, whose .gitignore is `*` + an allowlist for PKGBUILD/.SRCINFO. That
  # rule ignores tools/ui/src/lib/**/*.svelte, so Tailwind scans zero files and
  # the built bundle.css ships without any utility classes. An empty .git in
  # the extracted source tree stops the upward walk before that point.
  mkdir -p "${_pkgname}/.git"

  # patch -d "${srcdir}/llama.cpp" -Np1 -i "${srcdir}/llama-gfx1151.patch"
}

build() {
  pushd "${_pkgname}/tools/ui"
  npm ci
  npm run build
  popd

  # 配置环境
  if [[ -z "${ROCM_PATH}" ]]; then
    source /etc/profile
  fi
  export HIP_PATH="$(hipconfig -R)"
  export HIPCXX="$(hipconfig -l)/amdclang"
  export HIP_PLATFORM=amd
  # 清除核显上的函数调用开销
  # export HIP_CLANG_FLAGS="--offload-arch=gfx1151 -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false"

  local _cmake_options=(
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_SHARED_LIBS=ON
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_USE_SYSTEM_GGML=OFF
    -DLLAMA_BUILD_WEBUI=ON
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_BUILD_TESTS=OFF
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    # ROCm part
    # 偏向 512 宽度, 因为 zen5 原生支持 AVX-512
    # 激进的内联程度, 因为 zen5 的宽流水线需要减少函数边界
    # 更多的循环展开, 因为 zen5 的大型重排序缓冲区能够维持这些额外指令的在途执行
    -DCMAKE_HIP_FLAGS="-mprefer-vector-width=512 -mllvm -inline-threshold=600 -mllvm -unroll-threshold=150"
    -DAMDGPU_TARGETS="gfx1151"
    -DGGML_HIP=ON
    -DGGML_HIP_GRAPHS=ON
    # -DGGML_HIP_NO_VMM=OFF # Strix Halo 支持 VMM, 现在 rocm-nightly 的 VMM 没问题, 不过开了好像没太大用?
    -DGGML_CUDA_FORCE_MMQ=ON # 强制使用自定义乘法内核而非 fp16 cuBLAS. 可以加一点速并省一点显存
    # -DGGML_HIP_ROCWMMA_FATTN=ON # rocWMMA 开了也没啥用
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
      # -DGGML_HIP_EXPORT_METRICS=ON # 允许内核 perf metrics
      # -DGGML_ZENDNN=ON
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
  install -Dm644 "llama.cpp.sysusers" "${pkgdir}/usr/lib/sysusers.d/llama.cpp.conf"
  install -Dm644 "llama.cpp.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/llama.cpp.conf"

  msg2 "llama.cpp.service is now available"
  msg2 "llama-server arguments are in /etc/conf.d/llama.cpp"
}

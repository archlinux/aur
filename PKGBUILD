# Maintainer: Samuel Mesa <https://github.com/samtux>
# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=llama.cpp-gfx1152
_pkgname=${pkgname%%-gfx1152}
pkgver=b9592
pkgrel=1
pkgdesc="Port of Facebook's LLaMA model in C/C++ (Optimized for gfx1152 (Krackan), ROCm + Vulkan)"
arch=(x86_64 armv7h aarch64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  python
  openmp
  rocm-gfx1152-bin
  vulkan-icd-loader
)
makedepends=(
  cmake
  git
  # nodejs
  # npm
  shaderc
  vulkan-headers
  spirv-headers
)
optdepends=(
  'python-numpy: needed for convert_hf_to_gguf.py'
  'python-safetensors: needed for convert_hf_to_gguf.py'
  'python-sentencepiece: needed for convert_hf_to_gguf.py'
  'python-pytorch: needed for convert_hf_to_gguf.py'
  'python-transformers: needed for convert_hf_to_gguf.py'
  'python-gguf: needed for convert_hf_to_gguf.py'
)
provides=(${_pkgname} ${_pkgname}-hip ${_pkgname}-vulkan)
conflicts=(${_pkgname} ${_pkgname}-hip ${_pkgname}-vulkan libggml ggml stable-diffusion.cpp)
options=(lto !debug)
backup=("etc/conf.d/llama.cpp")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/${pkgver}.tar.gz"
  "llama.cpp.conf"
  "llama.cpp.service"
)
sha256sums=('e1b0185afcae8ba4b94b28d4b271018afbbcdfa6b26b6fad5f5176d5f1b351c5'
            '53fa70cfe40cb8a3ca432590e4f76561df0f129a31b121c9b4b34af0da7c4d87'
            '0377d08a07bda056785981d3352ccd2dbc0387c4836f91fb73e6b790d836620d')

prepare() {
  ln -sf "${_pkgname}-${pkgver}" llama.cpp

  # Tailwind v4's oxide scanner walks up looking for the nearest .git to anchor
  # .gitignore lookup. In AUR helpers (yay/paru) the parent .git is the AUR
  # clone, whose .gitignore is `*` + an allowlist for PKGBUILD/.SRCINFO. That
  # rule ignores tools/ui/src/lib/**/*.svelte, so Tailwind scans zero files and
  # the built bundle.css ships without any utility classes. An empty .git in
  # the extracted source tree stops the upward walk before that point.
  mkdir -p "${_pkgname}/.git"

  # patch -d "${srcdir}/llama.cpp" -Np1 -i "${srcdir}/llama-gfx1152.patch"
}

build() {
  pushd "${_pkgname}/tools/ui"
  npm ci
  npm run build
  popd

  # Set up ROCm environment
  if [[ -z "${ROCM_PATH}" ]]; then
    source /etc/profile
  fi
  export HIP_PATH="$(hipconfig -R)"
  export HIPCXX="$(hipconfig -l)/amdclang"
  export HIP_PLATFORM=amd
  # Eliminate function call overhead on iGPUs
  export HIP_CLANG_FLAGS="--offload-arch=gfx1152 -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false"

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
    # Prefer 512-bit width, since Zen5 natively supports AVX-512
    # Aggressive inlining, since Zen5's wide pipeline benefits from reduced function boundaries
    # More loop unrolling, since Zen5's large reorder buffer can sustain these extra in-flight instructions
    -DCMAKE_HIP_FLAGS="-mprefer-vector-width=512 -famd-opt -mllvm -inline-threshold=600 -mllvm -unroll-threshold=150"
    -DGGML_HIP=ON
    -DGGML_HIP_GRAPHS=ON
    -DGGML_HIP_NO_VMM=OFF # Strix Halo supports VMM, enable it
    -DGGML_CUDA_FORCE_MMQ=ON # Force custom mul kernels instead of fp16 cuBLAS. Slightly faster, saves VRAM
    # -DGGML_HIP_ROCWMMA_FATTN=ON # rocWMMA is broken right now
    -DHIP_PLATFORM=amd # Manually specify AMD platform, prevents errors when rocm-nightly disables auto-detection
    # Vulkan part
    -DGGML_VULKAN=ON

    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DLLAMA_BUILD_NUMBER="${pkgver#b}" # Fix version number
    -Wno-dev
  )

  # Force AMDGPU target to gfx1152 (Krackan)
  # Even if rocm_agent_enumerator doesn't detect gfx1152, compile the right kernels
  _cmake_options+=(
    -DAMDGPU_TARGETS="gfx1152"
  )

  # Check if building in CI environment
  if [ -n "$CI" ] && [ "$CI" != 0 ]; then
    msg2 "CI = $CI detected, building universal package"
    # Enable universal build
    _cmake_options+=(
      -DGGML_BACKEND_DL=ON
      -DGGML_CPU_ALL_VARIANTS=ON
      -DGGML_NATIVE=OFF
      # -DGGML_HIP_EXPORT_METRICS=ON # Enable kernel perf metrics
      # -DGGML_ZENDNN=ON
    )
  else
    # Local build, optimize for current device
    _cmake_options+=(
      -DGGML_NATIVE=ON
    )
  fi

  # Allow user custom build options
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

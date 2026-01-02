# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>

pkgname=darknet-hankai
pkgver=5.1
pkgrel=17
pkgdesc="An open source neural network framework written in C, C++, and CUDA"
arch=('x86_64')
url="https://github.com/hank-ai/darknet"
license=('Apache-2.0')
depends=('cmake' 'opencv' 'protobuf' 'openblas')
# Note: 'clang' and 'lld' are strictly required if building for ROCm/HIP
optdepends=('cuda: For NVIDIA GPU support'
            'rocm-hip-sdk: For AMD GPU support'
            'clang: Required for ROCm/HIP builds'
            'lld: Required for ROCm/HIP builds')
makedepends=('git')
source=("git+https://codeberg.org/CCodeRun/darknet.git#tag=v${pkgver}")
sha256sums=('f33743c9ef67a7a7a9109db2e2a29d291a0230ea9f67cb2d41c7f29da43e54c3')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

# --- Configuration ---
# Choose the GPU target: "auto", "cuda", "rocm", or "cpu".
# "auto" prioritizes ROCm if found, then CUDA, then CPU.
_gpu_target="auto"

# Use '!buildflags' to prevent makepkg from passing default GNU flags (-flto, etc.)
# which are incompatible with the CUDA and ROCm toolchains.
options=('!buildflags')

build() {
  cd "${srcdir}/darknet"
  mkdir -p build
  cd build

  # Base CMake arguments
  local cmake_args=(
      -DCMAKE_BUILD_TYPE=Release
      -DCMAKE_INSTALL_PREFIX=/usr
      -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=OFF
  )

  # --- Target Detection Logic ---

  local build_mode="${_gpu_target}"

  if [[ "${build_mode}" == "auto" ]]; then
    if [[ -d "/opt/rocm" ]] || command -v hipcc &>/dev/null; then
      build_mode="rocm"
    elif [[ -d "/opt/cuda" ]] || command -v nvcc &>/dev/null; then
      build_mode="cuda"
    else
      build_mode="cpu"
    fi
  fi

  # --- Build Configuration ---

  if [[ "${build_mode}" == "rocm" ]]; then
    msg "Configuring for AMD GPU (ROCm/HIP)..."
    
    # Modern CMake/FindHIP requires driving clang++ directly, not the hipcc wrapper.
    # We set the host compilers to clang and let CMake detect HIP support from there.
    # We do NOT set CMAKE_HIP_COMPILER.
    
    local rocm_lib_path="/opt/rocm/lib"
    local linker_flags="-fuse-ld=lld -L${rocm_lib_path}"

    cmake_args+=(
        -DCMAKE_C_COMPILER=clang
        -DCMAKE_CXX_COMPILER=clang++
        -DCMAKE_EXE_LINKER_FLAGS="${linker_flags}"
        -DCMAKE_SHARED_LINKER_FLAGS="${linker_flags}"
        -DCMAKE_MODULE_LINKER_FLAGS="${linker_flags}"
    )

  elif [[ "${build_mode}" == "cuda" ]]; then
    msg "Configuring for NVIDIA GPU (CUDA)..."

    local cuda_compiler=""
    if [[ -x "/opt/cuda/bin/nvcc" ]]; then
        cuda_compiler="/opt/cuda/bin/nvcc"
    else
        cuda_compiler="$(command -v nvcc)"
    fi

    if [[ -z "${cuda_compiler}" ]]; then
        error "CUDA build requested but 'nvcc' not found."
        return 1
    fi

    cmake_args+=(-DCMAKE_CUDA_COMPILER="${cuda_compiler}")

  else
    msg "Configuring for CPU-only..."
    # No specific flags needed; CMake finds OpenBLAS automatically
  fi

  # --- Execution ---
  
  cmake .. "${cmake_args[@]}"
  make -j$(nproc)
}

package() {
  cd "${srcdir}/darknet/build"
  make DESTDIR="${pkgdir}" install
}

# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>

pkgname=darknet-hankai
pkgver=6.0
pkgrel=2
pkgdesc="An open source neural network framework written in C, C++, and CUDA"
arch=('x86_64')
url="https://github.com/hank-ai/darknet"
license=('Apache-2.0')
depends=('cmake' 'opencv' 'protobuf' 'openblas' 'vtk' 'hdf5')
# Note: 'clang' and 'lld' are strictly required if building for ROCm/HIP
optdepends=('cuda: For NVIDIA GPU support'
            'rocm-hip-sdk: For AMD GPU support'
            'clang: Required for ROCm/HIP builds'
            'lld: Required for ROCm/HIP builds')
makedepends=('git' 'clang21')
source=("git+https://codeberg.org/CCodeRun/darknet.git#tag=v${pkgver}")
sha256sums=('b637e20e2290557d5007b09732efed7680104f19de153d7d16581ceb5b6e488d')
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
    
    # Arch Linux usually places ROCm LLVM in /opt/rocm/llvm/bin/
    local rocm_bin_path="/opt/rocm/llvm/bin"
    
    # Fallback for different ROCm layouts
    if [[ ! -x "${rocm_bin_path}/clang++" ]]; then
        rocm_bin_path="/opt/rocm/bin"
    fi

    if [[ ! -x "${rocm_bin_path}/clang++" ]]; then
        error "ROCm compiler not found in /opt/rocm/llvm/bin or /opt/rocm/bin"
        return 1
    fi

    export CC="${rocm_bin_path}/clang"
    export CXX="${rocm_bin_path}/clang++"
    export HIP_PATH="/opt/rocm"

    local rocm_lib_path="/opt/rocm/lib"
    local linker_flags="-fuse-ld=lld -L${rocm_lib_path}"

    cmake_args+=(
        -DCMAKE_C_COMPILER="${rocm_bin_path}/clang"
        -DCMAKE_CXX_COMPILER="${rocm_bin_path}/clang++"
        -DCMAKE_HIP_COMPILER="${rocm_bin_path}/clang++"
        -DCMAKE_EXE_LINKER_FLAGS="${linker_flags}"
        -DCMAKE_SHARED_LINKER_FLAGS="${linker_flags}"
        -DCMAKE_MODULE_LINKER_FLAGS="${linker_flags}"
    )

  elif [[ "${build_mode}" == "cuda" ]]; then
    msg "Configuring for NVIDIA GPU (CUDA)..."
    cmake_args+=(
        -DCMAKE_CUDA_COMPILER="${cuda_compiler}"
        -DCMAKE_CUDA_HOST_COMPILER=/usr/lib/llvm21/bin/clang
    )
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

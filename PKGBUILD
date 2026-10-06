# Maintainer: Bink
: "${_aur_ggml_build_universal:=${aur_ggml_build_universal:-false}}"
pkgname=ggml-cuda-git
_pkgname="${pkgname%-cuda-git}"
_srcname=llama.cpp
pkgver=b11434.r0.5e03bdd870
pkgrel=1
epoch=1
pkgdesc="Tensor library for machine learning (with NVIDIA CUDA optimizations)"
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/ggml'
license=('MIT')
depends=(
  cuda
  gcc-libs
  glibc
  nccl
  nvidia-utils
)
makedepends=(
  cmake
  gcc
  git
  ninja
)
optdepends=(
  'rdma-core: RDMA transport for RPC (rebuild with _aur_ggml_cmakeopts="-DGGML_RPC_RDMA=ON")'
)
# Note: This package provides libggml (with CUDA) to support downstream packages
# like llama.cpp-cuda-git and whisper.cpp-cuda that require CUDA-enabled GGML backends.
provides=(
  ggml-cuda-git
  libggml
  ggml
  libggml.so
  libggml-base.so
  libggml-cpu.so
  libggml-cuda.so
  libggml-rpc.so
)
conflicts=(
  libggml
  ggml
)
# Builds from the ggml/ subdirectory of the llama.cpp repo, to remain aligned with
# llama.cpp GGML code changes.
source=("git+https://github.com/ggml-org/llama.cpp.git")
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
  cd "${_srcname}" || exit
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  if ! type -P nvcc &>/dev/null && [[ -d /opt/cuda/bin ]]; then
    export PATH="/opt/cuda/bin:$PATH"
  fi

  # Build only the ggml/ subfolder of llama.cpp, so ggml stays in sync with
  # llama.cpp. A tiny generated CMakeLists.txt just does add_subdirectory() on
  # ggml/, like llama.cpp's own build. Building ggml/ directly would make its
  # CMakeLists.txt think it is a standalone build, which needs a ggml.pc.in
  # file llama.cpp does not ship.
  local _wrapper="${srcdir}/_ggml_wrapper"
  mkdir -p "${_wrapper}"
  cat > "${_wrapper}/CMakeLists.txt" <<EOF
cmake_minimum_required(VERSION 3.14)
project(ggml-cuda-git C CXX)
add_subdirectory("${srcdir}/${_srcname}/ggml" ggml)
EOF

  local _cmake_options=(
    -G Ninja
    -B build
    -S "${_wrapper}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_CUDA_HOST_COMPILER="${_nvcc_host_cxx}"
    -DBUILD_SHARED_LIBS=ON
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_BUILD_TESTS=OFF
    -DGGML_OPENMP=ON
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DGGML_RPC_RDMA=OFF
    -DGGML_CUDA=ON
    -DGGML_CUDA_NCCL=ON
    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DGGML_CUDA_COMPRESSION_MODE=speed
    -DGGML_CUDA_GRAPHS=ON
    -DGGML_LLAMAFILE=ON
    -DGGML_BLAS=OFF
    -DGGML_VULKAN=OFF
    -Wno-dev
  )

  if [[ ${_aur_ggml_build_universal} == true ]]; then
    echo "Building universal binary [_aur_ggml_build_universal == true]"
    _cmake_options+=(
      -DGGML_BACKEND_DL=ON
      -DGGML_NATIVE=OFF
      -DGGML_CPU_ALL_VARIANTS=ON
    )
  else
    # makepkg sets SOURCE_DATE_EPOCH, which would otherwise disable native defaults
    _cmake_options+=(
      -DGGML_BACKEND_DL=OFF
      -DGGML_NATIVE=ON
      -DCMAKE_CUDA_ARCHITECTURES=native
    )
  fi

  # Allow user-specified additional flags
  if [[ -n "${_aur_ggml_cmakeopts:-${aur_ggml_cmakeopts:-}}" ]]; then
    local _extra_cmake="${_aur_ggml_cmakeopts:-${aur_ggml_cmakeopts:-}}"
    echo "Applying custom CMake options: ${_extra_cmake}"
    # shellcheck disable=SC2206 # intentional word splitting
    _cmake_options+=(${_extra_cmake})
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_srcname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: Bink
: "${aur_ggml_build_universal:=false}"
pkgname=ggml-cuda-git
_pkgname="${pkgname%-cuda-git}"
_srcname=llama.cpp
pkgver=b10142.r1.88b47a755c
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
  nvidia-utils
)
makedepends=(
  cmake
  gcc15   # (CUDA does not yet support GCC 16)
  git
  ninja
)
optdepends=(
  'nccl: needed for multi-GPU parallelism (rebuild required)'
  'rdma-core: RDMA transport for RPC backend (rebuild required)'
)
# Note: This package provides libggml (with CUDA) to support downstream packages
# like llama.cpp-cuda-git and whisper.cpp-cuda that require CUDA-enabled GGML backends.
provides=(
  ggml-cuda-git
  libggml
  libggml.so
  ggml
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

  # Build only the ggml/ subfolder from llama.cpp, so ggml stays in sync with
  # what the current llama.cpp code expects.
  #
  # Building ggml/ directly makes its CMakeLists.txt think it's a standalone
  # build, which requires a ggml.pc.in file that llama.cpp doesn't ship,
  # causing a CMake error.
  #
  # This fix will wrap it in a tiny generated CMakeLists.txt that just does
  # add_subdirectory() on ggml/, like llama.cpp's own build uses normally,
  # so the standalone-build detection never triggers.
  local _wrapper="${srcdir}/_ggml_wrapper"
  mkdir -p "${_wrapper}"
  cat > "${_wrapper}/CMakeLists.txt" <<EOF
cmake_minimum_required(VERSION 3.14)
project(ggml-cuda-git C CXX)
add_subdirectory("${srcdir}/${_srcname}/ggml" ggml)
EOF

  # Use GCC 15 as host compiler for nvcc (CUDA does not yet support GCC 16)
  # Override via: aur_ggml_cmakeopts="-DCMAKE_CUDA_HOST_COMPILER=/usr/bin/g++-XX"
  local _nvcc_host_cxx="${CUDAHOSTCXX:-/usr/bin/g++-15}"

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
    -DGGML_CUDA=ON
    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DGGML_CUDA_COMPRESSION_MODE=speed
    -DGGML_CUDA_GRAPHS=ON
    -DGGML_LLAMAFILE=ON
    -DGGML_BLAS=OFF
    -DGGML_VULKAN=OFF
    -Wno-dev
  )

  if [[ ${aur_ggml_build_universal} == true ]]; then
    echo "Building universal binary [aur_ggml_build_universal == true]"
    _cmake_options+=(
      -DGGML_BACKEND_DL=ON
      -DGGML_NATIVE=OFF
      -DGGML_CPU_ALL_VARIANTS=ON
    )
  else
    # we lose GGML_NATIVE_DEFAULT due to how makepkg includes
    # $SOURCE_DATE_EPOCH in ENV
    _cmake_options+=(
      -DGGML_BACKEND_DL=OFF
      -DGGML_NATIVE=ON
      -DCMAKE_CUDA_ARCHITECTURES=native
    )
  fi

  # Allow user-specified additional flags
  if [[ -n "${aur_ggml_cmakeopts:-}" ]]; then
    echo "Applying custom CMake options: ${aur_ggml_cmakeopts}"
    # shellcheck disable=SC2206 # intentional word splitting
    _cmake_options+=(${aur_ggml_cmakeopts})
  fi

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_srcname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: NewYearPrism

_llama_cpp_version=9596
_ggml_version=0.14.0
_ggml_next_version=0.14.1
_llama_cpp_sha256sum=c80caadf88a211c6d6e7820ded7258a6c2c0a476926a04dd7e8708ba3e552c93
pkgname=ggml-hip
pkgver=${_ggml_version}.b${_llama_cpp_version}
pkgrel=1
pkgdesc='HIP/ROCm backend for ggml'
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/ggml'
license=('MIT')
depends=(
    "ggml>=${_ggml_version}.b9000"
    "ggml<${_ggml_next_version}"
    glibc
    libgcc
    hip-runtime-amd
    hipblas
    rocblas
)
makedepends=(
    "ggml=${pkgver}"
    cmake
    ninja
    git
    rocm-hip-sdk
)
options=(
    lto 
    !debug
)

build() {
  export HIP_PATH="$(hipconfig -R)"
  export HIPCXX="$(hipconfig -l)/clang"
  export HIP_PLATFORM=amd
  local _prefix_map="-ffile-prefix-map=${srcdir}/build=. -ffile-prefix-map=${srcdir}=."
  
  CFLAGS+=" ${_prefix_map}"
  CXXFLAGS+=" ${_prefix_map}"
  HIPFLAGS="-mllvm --amdgpu-unroll-threshold-local=600"
  HIPFLAGS+=" ${_prefix_map}"

  local _cmake_options=(
    -S /usr/src/ggml
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_C_FLAGS="${CFLAGS}"
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}"
    -DCMAKE_HIP_FLAGS="${HIPFLAGS}"
    -DCMAKE_SKIP_RPATH=ON
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -Wno-dev
  )

  local _amdgpu_targets=${AMDGPU_TARGETS:-"gfx906;gfx1010;gfx1030;gfx1031;gfx1100;gfx1101;gfx1102;gfx1151;gfx1200;gfx1201"}
  _cmake_options+=(-DCMAKE_HIP_ARCHITECTURES="${_amdgpu_targets}")

  _cmake_options+=(
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BACKEND_DL=ON
    -DGGML_BACKEND_DIR=/usr/lib/ggml/backends
    -DGGML_BUILD_TESTS=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_CPU=OFF
  )

  _cmake_options+=(
    -DGGML_NATIVE=OFF
    -DGGML_LTO=ON
    -DGGML_HIP=ON
    -DGGML_HIP_GRAPHS=ON
    -DHIP_PLATFORM=amd
    -DGGML_CUDA_FA_ALL_QUANTS=ON
  )

  if [[ -n "$GGML_HIP_BUILD_EXTRA_ARGS" ]]; then
    msg2 "Applied custom CMake build args: $GGML_HIP_BUILD_EXTRA_ARGS"
    _cmake_options+=($GGML_HIP_BUILD_EXTRA_ARGS)
  fi

  cmake "${_cmake_options[@]}"

  cmake --build build --target ggml-hip
}

package() {
  install -Dm755 build/bin/libggml-hip.so "${pkgdir}/usr/lib/ggml/backends/libggml-hip.so"
  install -Dm644 "/usr/share/licenses/ggml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

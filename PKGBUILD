# Maintainer: NewYearPrism

_ggml_version=0.21.0
_ggml_sha256sum=3b0d4f1fe7c278824d4bb753b7402733576985689bd40e9cc719eca627131d24
pkgname=ggml-hip-backend
pkgver=${_ggml_version}
pkgrel=1
pkgdesc='HIP/ROCm backend for ggml'
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/ggml'
license=('MIT')
provides=(ggml-acceleration)
depends=(
    "ggml-core=${pkgver}"
    glibc
    libgcc
    hip-runtime-amd
    hipblas
    rocblas
)
makedepends=(
    cmake
    ninja
    rocm-hip-sdk
)
options=(
    lto 
    !debug
)
source=(
    "ggml-${_ggml_version}.tar.gz::https://github.com/ggml-org/ggml/archive/refs/tags/v${_ggml_version}.tar.gz"
)
sha256sums=(
    ${_ggml_sha256sum}
)

prepare() {
  ln -sf "ggml-${_ggml_version}" ggml
}

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
    -S ggml
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
    for lib in build/bin/*; do
        install -Dm644 $lib "${pkgdir}/usr/lib/ggml/backends/$(basename $lib)"
    done
    install -Dm644 "ggml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

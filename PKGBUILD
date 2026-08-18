# Maintainer: NewYearPrism

_ggml_version=0.20.0
_ggml_sha256sum=85bdb8c38cf9e3074177713e34add52e57c1d310239de864e627d429dea3b51a
pkgname=ggml-cuda-backend
pkgver=${_ggml_version}
pkgrel=1
pkgdesc='CUDA backend for ggml'
arch=(x86_64)
url='https://github.com/ggml-org/ggml'
license=('MIT')
provides=(ggml-acceleration)
depends=(
    "ggml-core=${pkgver}"
    nvidia-utils
    cuda
    nccl
    glibc
    libstdc++
    libgcc
)
makedepends=(
    cmake
    ninja
    patch
    cudnn
)
options=(
    lto
    !debug
)
source=(
    "ggml-${_ggml_version}.tar.gz::https://github.com/ggml-org/ggml/archive/refs/tags/v${_ggml_version}.tar.gz"
    ggml-use-system-base.patch
)
sha256sums=(
    ${_ggml_sha256sum}
    78bb5e4a55846ac3627e7cb7c74ef28edd1e2b541b16c8189f2e4591953dea90
)

prepare() {
  ln -sf "ggml-${_ggml_version}" ggml
  patch -Np1 -d ggml -i "$srcdir/ggml-use-system-base.patch"
  rm -rf ggml/include/
}

build() {
  local _prefix_map="-ffile-prefix-map=${srcdir}/build=. -ffile-prefix-map=${srcdir}=."
  local _cuda_prefix_map="-Xcompiler=-ffile-prefix-map=${srcdir}/build=. -Xcompiler=-ffile-prefix-map=${srcdir}=."
  CFLAGS+=" ${_prefix_map}"
  CXXFLAGS+=" ${_prefix_map}"

  local _cmake_options=(
    -S ggml
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_C_FLAGS="${CFLAGS}"
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}"
    -DCMAKE_CUDA_FLAGS="${CUDAFLAGS} ${_cuda_prefix_map}"
    -DCMAKE_SKIP_RPATH=ON
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -Wno-dev
  )

  if [ -n "$CUDA_TARGETS" ]; then 
    _cmake_options+=(-DCMAKE_CUDA_ARCHITECTURES=${CUDA_TARGETS})
  fi

  _cmake_options+=(
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BACKEND_DL=ON
    -DGGML_BACKEND_DIR=/usr/lib/ggml/backends
    -DGGML_BUILD_TESTS=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_CPU=OFF
    -DGGML_USE_SYSTEM_BASE=ON
  )

  _cmake_options+=(
    -DGGML_NATIVE=OFF
    -DGGML_LTO=ON
    -DGGML_CUDA=ON
    -DGGML_CUDA_NCCL=ON
    -DGGML_CUDNN=ON
    -DGGML_CUDA_FA_ALL_QUANTS=ON
  )

  if [[ -n "$GGML_CUDA_BUILD_EXTRA_ARGS" ]]; then
    msg2 "Applied custom CMake build args: $GGML_CUDA_BUILD_EXTRA_ARGS"
    _cmake_options+=($GGML_CUDA_BUILD_EXTRA_ARGS)
  fi

  cmake "${_cmake_options[@]}"

  cmake --build build --target ggml-cuda
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "ggml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

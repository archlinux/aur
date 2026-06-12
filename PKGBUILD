# Maintainer: NewYearPrism

_ggml_version=0.15.1
pkgname=ggml-cuda
pkgver=${_ggml_version}
pkgrel=2
pkgdesc='CUDA backend for ggml'
arch=(x86_64)
url='https://github.com/ggml-org/ggml'
license=('MIT')
depends=(
    "ggml=${pkgver}"
    nvidia-utils
    cuda
    nccl
    glibc
    libstdc++
    libgcc
)
makedepends=(
    "ggml-src=${pkgver}"
    cmake
    ninja
    git
    cudnn
)
options=(
    lto
    !debug
)

build() {
  local _prefix_map="-ffile-prefix-map=${srcdir}/build=. -ffile-prefix-map=${srcdir}=."
  local _cuda_prefix_map="-Xcompiler=-ffile-prefix-map=${srcdir}/build=. -Xcompiler=-ffile-prefix-map=${srcdir}=."
  CFLAGS+=" ${_prefix_map}"
  CXXFLAGS+=" ${_prefix_map}"

  local _cmake_options=(
    -S /usr/src/ggml-${pkgver}
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
  install -Dm755 build/bin/libggml-cuda.so "${pkgdir}/usr/lib/ggml/backends/libggml-cuda.so"
  install -Dm644 "/usr/share/licenses/ggml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

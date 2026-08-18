# Maintainer: NewYearPrism

_llama_cpp_version=10453
_llama_cpp_sha256sum=2c2b62a081c73e3de06c3ee8ef9f77847273485b9dd10236a4f0f107402956de
pkgname=ggml-vulkan-backend-llama.cpp
pkgver=0.0.0.b${_llama_cpp_version}
pkgrel=1
pkgdesc='Vulkan backend for ggml (from llama.cpp)'
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
groups=(ggml-llama.cpp)
provides=(
    ggml-vulkan-backend
    ggml-acceleration
)
conflicts=(
    ggml-vulkan-backend
)
depends=(
    "ggml-core-llama.cpp=${pkgver}"
    glibc
    libstdc++
    libgcc
    vulkan-icd-loader
)
makedepends=(
    cmake
    ninja
    patch
    shaderc
    spirv-headers
    vulkan-headers
)
options=(
    lto
    !debug
)
source=(
    "llama.cpp-b${_llama_cpp_version}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/b${_llama_cpp_version}.tar.gz"
    ggml-use-system-base.patch
)
sha256sums=(
    ${_llama_cpp_sha256sum}
    78bb5e4a55846ac3627e7cb7c74ef28edd1e2b541b16c8189f2e4591953dea90
)

prepare() {
  ln -sf "llama.cpp-b${_llama_cpp_version}" llama.cpp
  patch -Np1 -d llama.cpp/ggml -i "$srcdir/ggml-use-system-base.patch"
  rm -rf llama.cpp/ggml/include/
}

build() {
  local _prefix_map="-ffile-prefix-map=${srcdir}/build=. -ffile-prefix-map=${srcdir}=."
  CFLAGS+=" ${_prefix_map}"
  CXXFLAGS+=" ${_prefix_map}"

  local _cmake_options=(
    -S llama.cpp/ggml
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_C_FLAGS="${CFLAGS}"
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}"
    -DCMAKE_SKIP_RPATH=ON
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -Wno-dev
  )

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
    -DGGML_VULKAN=ON
    -DGGML_CUDA_FA_ALL_QUANTS=ON
  )

  if [[ -n "$GGML_VULKAN_BUILD_EXTRA_ARGS" ]]; then
    msg2 "Applied custom CMake build args: $GGML_VULKAN_BUILD_EXTRA_ARGS"
    _cmake_options+=($GGML_VULKAN_BUILD_EXTRA_ARGS)
  fi

  cmake "${_cmake_options[@]}"

  cmake --build build --target ggml-vulkan
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 llama.cpp/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

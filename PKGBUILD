# Maintainer: NewYearPrism

_llama_cpp_version=10321
_llama_cpp_sha256sum=06f0eae150fd8617bd3adfe2f773c12b74d23ef048a696a78b58d5ba73824e41
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
    b5b80ba3647d207a653dee190461b92e3792b0c5c610549d2ef4f48de0ad8565
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

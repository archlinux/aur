# Maintainer: NewYearPrism

_llama_cpp_version=9596
_ggml_version=0.14.0
_ggml_next_version=0.14.1
_llama_cpp_sha256sum=c80caadf88a211c6d6e7820ded7258a6c2c0a476926a04dd7e8708ba3e552c93
pkgname=llama.cpp-ggml
pkgver=0.0.0.b${_llama_cpp_version}
pkgrel=1
pkgdesc='LLM inference in C/C++ (use system ggml)'
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=(
    glibc
    libstdc++
    libgcc
    openssl
    "ggml>=${_ggml_version}.b9000"
    "ggml<${_ggml_next_version}"
)
makedepends=(
    cmake
    ninja
    git
    nodejs
    npm
)
optdepends=(
    'ggml-cpu: CPU inference'
    'ggml-vulkan: Vulkan inference'
    'ggml-cuda: CUDA inference'
    'ggml-hip: HIP/ROCm inference'
)
provides=(
    llama.cpp
    libllama
)
conflicts=(
    llama.cpp
)
options=(
    lto
    !debug
)
source=("llama.cpp-b${_llama_cpp_version}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/b${_llama_cpp_version}.tar.gz")
sha256sums=(${_llama_cpp_sha256sum})

prepare() {
  ln -sf "llama.cpp-b${_llama_cpp_version}" llama.cpp
  mkdir -p "llama.cpp/.git"
}

build() {
  local _prefix_map="-ffile-prefix-map=${srcdir}/build=. -ffile-prefix-map=${srcdir}=."
  CFLAGS+=" ${_prefix_map}"
  CXXFLAGS+=" ${_prefix_map}"

  local _cmake_options=(
    -S "llama.cpp"
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_C_FLAGS="${CFLAGS}"
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}"
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
    -DCMAKE_SKIP_RPATH=ON
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DBUILD_SHARED_LIBS=ON
    -Wno-dev
  )

  _cmake_options+=(
    -DLLAMA_BUILD_NUMBER="${_llama_cpp_version}"
    -DLLAMA_ALL_WARNINGS=OFF
    -DLLAMA_ALL_WARNINGS_3RD_PARTY=OFF
    -DLLAMA_USE_SYSTEM_GGML=ON
    -DLLAMA_BUILD_WEBUI=ON
    -DLLAMA_BUILD_COMMON=ON
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_BUILD_EXAMPLES=OFF
    -DLLAMA_BUILD_TOOLS=ON
    -DLLAMA_BUILD_SERVER=ON
    -DLLAMA_BUILD_APP=OFF
    -DLLAMA_TOOLS_INSTALL=ON
    -DLLAMA_TESTS_INSTALL=OFF
    -DLLAMA_OPENSSL=ON
  )

  if [[ -n "$LLAMA_CPP_BUILD_EXTRA_ARGS" ]]; then
    msg2 "Applied custom CMake build args: $LLAMA_CPP_BUILD_EXTRA_ARGS"
    _cmake_options+=($LLAMA_CPP_BUILD_EXTRA_ARGS)
  fi

  cmake "${_cmake_options[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "llama.cpp/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

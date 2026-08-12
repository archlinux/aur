# Maintainer: NewYearPrism

_llama_cpp_version=10321
_llama_cpp_sha256sum=06f0eae150fd8617bd3adfe2f773c12b74d23ef048a696a78b58d5ba73824e41
pkgname=llama.cpp-system
pkgver=0.0.0.b${_llama_cpp_version}
pkgrel=1
pkgdesc='LLM inference in C/C++ (use system ggml)'
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=(
    ggml-core
    glibc
    libstdc++
    libgcc
    openssl
)
makedepends=(
    cmake
    ninja
    nodejs
    npm
)
optdepends=(
    'ggml-acceleration: GPU acceleration'
)
provides=(
    llama.cpp
    libllama
)
conflicts=(
    llama.cpp
)
replaces=(
    llama.cpp-ggml
)
options=(
    lto
    !debug
)
source=("llama.cpp-b${_llama_cpp_version}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/b${_llama_cpp_version}.tar.gz")
sha256sums=(${_llama_cpp_sha256sum})

prepare() {
  ln -sf "llama.cpp-b${_llama_cpp_version}" llama.cpp
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
    depends+=(
        ggml-cpu-backend
    )
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "llama.cpp/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

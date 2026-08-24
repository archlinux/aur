# Maintainer: NewYearPrism

_llama_cpp_version=10603
_llama_cpp_sha256sum=7a319224f291d4c533e634aa861ed9407f5287d06424212830ff7444db5a578b
_ggml_version=0.21.0
_ggml_sha256sum=3b0d4f1fe7c278824d4bb753b7402733576985689bd40e9cc719eca627131d24
pkgname=ggml-core-llama.cpp
pkgver=0.0.0.b${_llama_cpp_version}
pkgrel=1
pkgdesc='Tensor library for machine learning (core runtime, from llama.cpp)'
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
groups=(ggml-llama.cpp)
depends=(
    glibc
    libstdc++
    libgcc
)
makedepends=(
    cmake
    ninja
    patch
)
provides=(
    ggml-core
    libggml
    ggml
)
conflicts=(
    ggml-core
    libggml
    ggml
)
options=(
    lto
    !debug
)
source=(
    "llama.cpp-b${_llama_cpp_version}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/b${_llama_cpp_version}.tar.gz"
    ggml-h-ggml-max-name-128.patch
    "ggml-${_ggml_version}.tar.gz::https://github.com/ggml-org/ggml/archive/refs/tags/v${_ggml_version}.tar.gz"
)
sha256sums=(
    ${_llama_cpp_sha256sum}
    b3be0f6368ca8344e52e044f60dc81efb98e646e93ce3fe690f8d8b4750eb27a
    ${_ggml_sha256sum}
)

prepare() {
  ln -sf "llama.cpp-b${_llama_cpp_version}" llama.cpp
  ln -sf "ggml-${_ggml_version}" ggml
  cp ggml/ggml.pc.in llama.cpp/ggml/ggml.pc.in
  patch -Np1 -d llama.cpp/ggml -i "$srcdir/ggml-h-ggml-max-name-128.patch"
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
    -DGGML_OPENMP=OFF
  )

  _cmake_options+=(
    -DGGML_NATIVE=OFF
    -DGGML_LTO=ON
  )

  if [[ -n "$GGML_BUILD_EXTRA_ARGS" ]]; then
    msg2 "Applied custom CMake build args: $GGML_BUILD_EXTRA_ARGS"
    _cmake_options+=($GGML_BUILD_EXTRA_ARGS)
  fi

  cmake "${_cmake_options[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 llama.cpp/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

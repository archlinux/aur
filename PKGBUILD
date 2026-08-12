# Maintainer: NewYearPrism

_llama_cpp_version=10321
_llama_cpp_sha256sum=06f0eae150fd8617bd3adfe2f773c12b74d23ef048a696a78b58d5ba73824e41
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
    ggml.pc.in
)
sha256sums=(
    ${_llama_cpp_sha256sum}
    b3be0f6368ca8344e52e044f60dc81efb98e646e93ce3fe690f8d8b4750eb27a
    4df038e6d2f345fb8a930cb76014fd6a9fdeb793a6fa3593f436fc29e0589eee
)

prepare() {
  ln -sf "llama.cpp-b${_llama_cpp_version}" llama.cpp
  cp "$srcdir/ggml.pc.in" llama.cpp/ggml/ggml.pc.in
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

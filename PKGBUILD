# Maintainer: NewYearPrism

_llama_cpp_version=9596
_ggml_version=0.14.0
_llama_cpp_sha256sum=c80caadf88a211c6d6e7820ded7258a6c2c0a476926a04dd7e8708ba3e552c93
pkgname=ggml
pkgver=${_ggml_version}.b${_llama_cpp_version}
pkgrel=1
pkgdesc='Tensor library for machine learning (API library)'
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/ggml'
license=('MIT')
depends=(
    glibc
    libstdc++
    libgcc
    libgomp
    python
    python-yaml
)
makedepends=(
    cmake
    ninja
    git
    patch
)
provides=(
    libggml
    ggml
)
conflicts=(
    libggml
    ggml
)
options=(
    lto
    !debug
)
source=(
    "llama.cpp-b${_llama_cpp_version}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/b${_llama_cpp_version}.tar.gz"
    ggml.pc.in
    ggml-h-ggml-max-name-128.patch
)
sha256sums=(
    ${_llama_cpp_sha256sum}
    4df038e6d2f345fb8a930cb76014fd6a9fdeb793a6fa3593f436fc29e0589eee
    b3be0f6368ca8344e52e044f60dc81efb98e646e93ce3fe690f8d8b4750eb27a
)

prepare() {
  ln -sf "llama.cpp-b${_llama_cpp_version}" llama.cpp
  mkdir -p llama.cpp/.git
  cp -f ggml.pc.in llama.cpp/ggml/
  patch -Np1 -d llama.cpp/ggml -i $srcdir/ggml-h-ggml-max-name-128.patch
}

build() {
  local _prefix_map="-ffile-prefix-map=${srcdir}/build=. -ffile-prefix-map=${srcdir}=."
  CFLAGS+=" ${_prefix_map}"
  CXXFLAGS+=" ${_prefix_map}"

  local _cmake_options=(
    -S "llama.cpp/ggml"
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
  install -dm755 "${pkgdir}/usr/src/"
  cp -r llama.cpp/ggml "${pkgdir}/usr/src/ggml-${pkgver}"
  ln -s "ggml-${pkgver}" "${pkgdir}/usr/src/ggml"
}

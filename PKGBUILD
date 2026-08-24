# Maintainer: NewYearPrism

_llama_cpp_version=10603
_llama_cpp_sha256sum=7a319224f291d4c533e634aa861ed9407f5287d06424212830ff7444db5a578b
_ggml_version=0.21.0
_ggml_sha256sum=3b0d4f1fe7c278824d4bb753b7402733576985689bd40e9cc719eca627131d24
pkgname=ggml-cpu-backend-llama.cpp
pkgver=0.0.0.b${_llama_cpp_version}
pkgrel=2
pkgdesc='CPU backend for ggml (from llama.cpp)'
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=(
    "ggml-core-llama.cpp=${pkgver}"
    glibc
    libstdc++
    libgcc
    libgomp
)
makedepends=(
    cmake
    ninja
)
provides=(
    ggml-cpu-backend
)
conflicts=(
    ggml-cpu-backend
)
options=(
    lto
    !debug
)
source=(
    "llama.cpp-b${_llama_cpp_version}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/b${_llama_cpp_version}.tar.gz"
    "ggml-${_ggml_version}.tar.gz::https://github.com/ggml-org/ggml/archive/refs/tags/v${_ggml_version}.tar.gz"
)
sha256sums=(
    ${_llama_cpp_sha256sum}
    ${_ggml_sha256sum}
)

prepare() {
  ln -sf "llama.cpp-b${_llama_cpp_version}" llama.cpp
  ln -sf "ggml-${_ggml_version}" ggml
  cp ggml/ggml.pc.in llama.cpp/ggml/ggml.pc.in
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
  )

  _cmake_options+=(
    -DGGML_NATIVE=OFF
    -DGGML_LTO=ON
  )

  if [ "$GGML_CPU_ALL_VARIANTS" == 0 ] || [ "$GGML_CPU_ALL_VARIANTS" == off ]; then
    msg2 "GGML_CPU_ALL_VARIANTS: OFF"
    _cmake_options+=(
      -DGGML_CPU=ON
      -DGGML_CPU_ALL_VARIANTS=OFF
    )
  else
    msg2 "GGML_CPU_ALL_VARIANTS: ON"
    _cmake_options+=(
      -DGGML_CPU_ALL_VARIANTS=ON
    )
  fi

  if [[ -n "$GGML_CPU_BUILD_EXTRA_ARGS" ]]; then
    msg2 "Applied custom CMake build args: $GGML_CPU_BUILD_EXTRA_ARGS"
    _cmake_options+=($GGML_CPU_BUILD_EXTRA_ARGS)
  fi

  cmake "${_cmake_options[@]}"

  cmake --build build --target ggml
}

package() {
    for lib in build/bin/*; do
        install -Dm644 $lib "${pkgdir}/usr/lib/ggml/backends/$(basename $lib)"
    done
    install -Dm644 "ggml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

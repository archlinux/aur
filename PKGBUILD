# Maintainer: NewYearPrism

_llama_cpp_version=10321
_llama_cpp_sha256sum=06f0eae150fd8617bd3adfe2f773c12b74d23ef048a696a78b58d5ba73824e41
pkgname=ggml-cpu-backend-llama.cpp
pkgver=0.0.0.b${_llama_cpp_version}
pkgrel=1
pkgdesc='CPU backend for ggml (from llama.cpp)'
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
groups=(ggml-llama.cpp)
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
    patch
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
    -DGGML_USE_SYSTEM_BASE=ON
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

  if [ "$GGML_CPU_ALL_VARIANTS" == 0 ] || [ "$GGML_CPU_ALL_VARIANTS" == off ]; then
    cmake --build build --target ggml-cpu
  else
    mapfile -t _cpu_targets < <(grep -oE '^build ggml-cpu[A-Za-z0-9._-]*: phony' build/build.ninja | sed -E 's/^build //; s/: phony$//' | grep -v -- '-feats$' | sort -u)
    cmake --build build --target "${_cpu_targets[@]}"
  fi
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 llama.cpp/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

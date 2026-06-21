# Maintainer: NewYearPrism

_ggml_version=0.15.2
pkgname=ggml-vulkan
pkgver=${_ggml_version}
pkgrel=1
pkgdesc='Vulkan backend for ggml'
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/ggml'
license=('MIT')
depends=(
    "ggml=${pkgver}"
    glibc
    libstdc++
    libgcc
    vulkan-icd-loader
)
makedepends=(
    "ggml-src=${pkgver}"
    cmake
    ninja
    git
    shaderc
    spirv-headers
    vulkan-headers
)
options=(
    lto
    !debug
)

build() {
  local _prefix_map="-ffile-prefix-map=${srcdir}/build=. -ffile-prefix-map=${srcdir}=."
  CFLAGS+=" ${_prefix_map}"
  CXXFLAGS+=" ${_prefix_map}"

  local _cmake_options=(
    -S /usr/src/ggml-${pkgver}
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
  install -Dm755 build/bin/libggml-vulkan.so "${pkgdir}/usr/lib/ggml/backends/libggml-vulkan.so"
  install -Dm644 "/usr/share/licenses/ggml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

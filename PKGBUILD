# Maintainer: NewYearPrism

_ggml_version=0.15.1
pkgname=ggml-cpu
pkgver=${_ggml_version}
pkgrel=1
pkgdesc='CPU backend for ggml'
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/ggml'
license=('MIT')
depends=(
    "ggml=${pkgver}"
    glibc
    libstdc++
    libgcc
    libgomp
)
makedepends=(
    "ggml-src=${pkgver}"
    cmake
    ninja
    git
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
  )

  _cmake_options+=(
    -DGGML_NATIVE=OFF
    -DGGML_LTO=ON
  )

  if [ "$GGML_CPU_ALL_VARIANTS" == 0 ]; then
    _cmake_options+=(
      -DGGML_CPU=ON
    )
  else
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
  for lib in build/bin/libggml-cpu*.so; do
    install -Dm755 "$lib" "${pkgdir}/usr/lib/ggml/backends/$(basename $lib)"
  done
  install -Dm644 "/usr/share/licenses/ggml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# Maintainer: NewYearPrism

_ggml_version=0.16.0
_ggml_sha256sum=8e1741cd44c036468ee2b8531343bbe1205bc26bc63b866030679cc5f28ec0bf
pkgname=ggml-cpu-backend
pkgver=${_ggml_version}
pkgrel=1
pkgdesc='CPU backend for ggml'
arch=(x86_64 aarch64)
url='https://github.com/ggml-org/ggml'
license=('MIT')
groups=(ggml)
depends=(
    "ggml-core=${pkgver}"
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
options=(
    lto
    !debug
)
source=(
    "ggml-${_ggml_version}.tar.gz::https://github.com/ggml-org/ggml/archive/refs/tags/v${_ggml_version}.tar.gz"
    ggml-use-system-base.patch
)
sha256sums=(
    ${_ggml_sha256sum}
    2389838195777ef00dce012ef63a52a25dd119880b35e8c811c35f66d3d5b940
)

prepare() {
  ln -sf "ggml-${_ggml_version}" ggml
  patch -Np1 -d ggml -i "$srcdir/ggml-use-system-base.patch"
  rm -rf ggml/include/
}

build() {
  local _prefix_map="-ffile-prefix-map=${srcdir}/build=. -ffile-prefix-map=${srcdir}=."
  CFLAGS+=" ${_prefix_map}"
  CXXFLAGS+=" ${_prefix_map}"

  local _cmake_options=(
    -S ggml
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
  install -Dm644 "ggml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

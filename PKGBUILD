# Maintainer: NewYearPrism

_ggml_version=0.15.2
_ggml_sha256sum=298e958817a126c44bb8e97c97d5d53d00bd15eca22bebf805f278223fe29e07
pkgname=ggml
pkgver=${_ggml_version}
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
    "libggml=${pkgver}"
    "ggml-src=${pkgver}"
)
conflicts=(
    libggml
)
options=(
    lto
    !debug
)
source=(
    "ggml-${pkgver}.tar.gz::https://github.com/ggml-org/ggml/archive/refs/tags/v${pkgver}.tar.gz"
    ggml-h-ggml-max-name-128.patch
)
sha256sums=(
    ${_ggml_sha256sum}
    b3be0f6368ca8344e52e044f60dc81efb98e646e93ce3fe690f8d8b4750eb27a
)

prepare() {
  ln -sf "ggml-${pkgver}" ggml
  patch -Np1 -d ggml -i $srcdir/ggml-h-ggml-max-name-128.patch
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

  install -Dm644 ggml/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -dm755 "${pkgdir}/usr/src/"
  cp -r "ggml-${pkgver}" "${pkgdir}/usr/src/ggml-${pkgver}"
}

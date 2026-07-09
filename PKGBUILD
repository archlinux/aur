# Maintainer: NewYearPrism

_stable_diffusion_cpp_tag=master-769-cc73429
_stable_diffusion_cpp_version=769
_stable_diffusion_cpp_commit=${_stable_diffusion_cpp_tag##*-}
_ggml_version=0.15.3
_ggml_sha256sum=86800455b5520fc86023979790703a9e2e1e4038b20039334be21df4d55bc868
_stable_diffusion_cpp_sha256sum=bd95581abf579adf52e1bfd48fcc303d7d1444d2e605933ef93765ff4287a1fd
_sdcpp_webui_commit=c4bce3d6b3f236614cca21014f076083b7270ba8
_sdcpp_webui_sha256sum=1265543d02ebab560cee6734b3bf1491e831c6be3436647505d6939dd78f2993
pkgname=stable-diffusion.cpp-system
pkgver=0.0.0.${_stable_diffusion_cpp_version}
pkgrel=1
pkgdesc='Diffusion model(SD,Flux,Wan,...) inference in pure C/C++ (use system ggml)'
arch=(x86_64 aarch64)
url='https://github.com/leejet/stable-diffusion.cpp'
license=('MIT')
depends=(
    "ggml-core=${_ggml_version}"
    glibc
    libstdc++
    libgcc
    libwebp
)
makedepends=(
    cmake
    ninja
    pnpm
)
optdepends=(
    'ggml-acceleration: GPU acceleration'
)
provides=(
    libstable-diffusion
    stable-diffusion.cpp
)
conflicts=(
    stable-diffusion.cpp
)
replaces=(
    stable-diffusion.cpp-ggml
)
options=(
    lto
    !debug
)
source=(
    "stable-diffusion.cpp-${_stable_diffusion_cpp_tag}.tar.gz::https://github.com/leejet/stable-diffusion.cpp/archive/refs/tags/${_stable_diffusion_cpp_tag}.tar.gz"
    "sdcpp-webui-${_sdcpp_webui_commit}.tar.gz::https://github.com/leejet/sdcpp-webui/archive/${_sdcpp_webui_commit}.tar.gz"
    "ggml-${_ggml_version}.tar.gz::https://github.com/ggml-org/ggml/archive/refs/tags/v${_ggml_version}.tar.gz"
)
sha256sums=(
    ${_stable_diffusion_cpp_sha256sum}
    ${_sdcpp_webui_sha256sum}
    ${_ggml_sha256sum}
)

prepare() {
  ln -sf "stable-diffusion.cpp-${_stable_diffusion_cpp_tag}" stable-diffusion.cpp
  ln -sf "sdcpp-webui-${_sdcpp_webui_commit}" sdcpp-webui
  rm -rf stable-diffusion.cpp/examples/server/frontend
  ln -sf "../../../sdcpp-webui" stable-diffusion.cpp/examples/server/frontend

  mkdir -p stable-diffusion.cpp/ggml/src
  tar -xzf "ggml-${_ggml_version}.tar.gz" --strip-components=1 -C stable-diffusion.cpp/ggml "ggml-${_ggml_version}/src/ggml-impl.h"
}

build() {
  local _prefix_map="-ffile-prefix-map=${srcdir}/build=. -ffile-prefix-map=${srcdir}=."
  CFLAGS+=" ${_prefix_map}"
  CXXFLAGS+=" ${_prefix_map}"

  local _cmake_options=(
    -S "stable-diffusion.cpp"
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_C_FLAGS="${CFLAGS}"
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}"
    -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
    -DCMAKE_SKIP_RPATH=ON
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DSDCPP_BUILD_VERSION="${_stable_diffusion_cpp_tag}"
    -DSDCPP_BUILD_COMMIT="${_stable_diffusion_cpp_commit}"
    -DSD_USE_SYSTEM_GGML=ON
    -DSD_BUILD_SHARED_LIBS=ON
    -DSD_BUILD_EXAMPLES=ON
    -DSD_SERVER_BUILD_FRONTEND=ON
    -DSD_WEBP=ON
    -DSD_USE_SYSTEM_WEBP=ON
    -DSD_WEBM=OFF
    -Wno-dev
  )

  if [[ -n "$STABLE_DIFFUSION_CPP_BUILD_EXTRA_ARGS" ]]; then
    msg2 "Applied custom CMake build args: $STABLE_DIFFUSION_CPP_BUILD_EXTRA_ARGS"
    _cmake_options+=($STABLE_DIFFUSION_CPP_BUILD_EXTRA_ARGS)
  fi

  cmake "${_cmake_options[@]}"

  cmake --build build
}

package() {
    depends+=(
        ggml-cpu-backend
    )
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "stable-diffusion.cpp/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

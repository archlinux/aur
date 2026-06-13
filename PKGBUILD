# Maintainer: NewYearPrism

_stable_diffusion_cpp_tag=master-692-9b0fceb
_stable_diffusion_cpp_version=692
_stable_diffusion_cpp_commit=${_stable_diffusion_cpp_tag##*-}
_ggml_version=0.15.1
_stable_diffusion_cpp_sha256sum=ce8ba0c5ce4c4499541b0998361ec619c0aeb540d818e86e5e99401e22ab2400
_sdcpp_webui_commit=797ccf80825cc035508ba9b599b2a21953e7f835
_sdcpp_webui_sha256sum=a053b9b606a44bc07e555e23d04fc5e834b78cb267d3e0fdf640ff66f131e8c9
pkgname=stable-diffusion.cpp-ggml
pkgver=0.0.0.${_stable_diffusion_cpp_version}
pkgrel=1
pkgdesc='Diffusion model(SD,Flux,Wan,...) inference in pure C/C++ (use system ggml)'
arch=(x86_64 aarch64)
url='https://github.com/leejet/stable-diffusion.cpp'
license=('MIT')
depends=(
    "ggml=${_ggml_version}"
    glibc
    libstdc++
    libgcc
    libwebp
)
makedepends=(
    "ggml-src=${_ggml_version}"
    cmake
    ninja
    git
    pnpm
)
optdepends=(
    'ggml-cpu: CPU inference'
    'ggml-vulkan: Vulkan inference'
    'ggml-cuda: CUDA inference'
    'ggml-hip: HIP/ROCm inference'
)
provides=(
    libstable-diffusion
    stable-diffusion.cpp
)
conflicts=(
    stable-diffusion.cpp
)
options=(
    lto
    !debug
)
source=(
    "stable-diffusion.cpp-${_stable_diffusion_cpp_tag}.tar.gz::https://github.com/leejet/stable-diffusion.cpp/archive/refs/tags/${_stable_diffusion_cpp_tag}.tar.gz"
    "sdcpp-webui-${_sdcpp_webui_commit}.tar.gz::https://github.com/leejet/sdcpp-webui/archive/${_sdcpp_webui_commit}.tar.gz"
)
sha256sums=(
    ${_stable_diffusion_cpp_sha256sum}
    ${_sdcpp_webui_sha256sum}
)

prepare() {
  ln -sf "stable-diffusion.cpp-${_stable_diffusion_cpp_tag}" stable-diffusion.cpp
  ln -sf "sdcpp-webui-${_sdcpp_webui_commit}" sdcpp-webui
  mkdir -p "stable-diffusion.cpp/.git"
  rm -rf stable-diffusion.cpp/ggml
  ln -sf /usr/src/ggml-${_ggml_version} stable-diffusion.cpp/ggml
  rm -rf stable-diffusion.cpp/examples/server/frontend
  ln -sf "../../../sdcpp-webui" stable-diffusion.cpp/examples/server/frontend
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
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "stable-diffusion.cpp/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

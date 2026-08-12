# Maintainer: NewYearPrism

_stable_diffusion_cpp_tag=master-813-bfbef5b
_stable_diffusion_cpp_version=813
_stable_diffusion_cpp_commit=${_stable_diffusion_cpp_tag##*-}
_stable_diffusion_cpp_sha256sum=3dd992e72fafa2d2553d91efe35c2f34df78831163b709c25735fc702f291cad
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
    ggml-core
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
    ggml-impl.h
)
sha256sums=(
    ${_stable_diffusion_cpp_sha256sum}
    ${_sdcpp_webui_sha256sum}
    2ed56e264202906d107e26d08eabb242d3107b026ebfb78096fa1e5f94bdbbb8
)

prepare() {
  ln -sf "stable-diffusion.cpp-${_stable_diffusion_cpp_tag}" stable-diffusion.cpp
  ln -sf "sdcpp-webui-${_sdcpp_webui_commit}" sdcpp-webui
  rm -rf stable-diffusion.cpp/examples/server/frontend
  ln -sf "../../../sdcpp-webui" stable-diffusion.cpp/examples/server/frontend

  mkdir -p stable-diffusion.cpp/ggml/src
  cp "$srcdir/ggml-impl.h" stable-diffusion.cpp/ggml/src/ggml-impl.h
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

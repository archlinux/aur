# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

_pkgname=gufo
pkgname=${_pkgname}-git
pkgver=0.33.0.r9.gb62b1674
pkgrel=1
pkgdesc="The Open Source Strix Halo AI engine (git version)."
arch=(x86_64)
url='https://github.com/gufo-org/gufo'
license=('MIT')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
install=gufo-git.install

depends=(
  curl
  ffmpeg
  gcc-libs
  glibc
  hip-runtime-amd
  hipblas
  hipblaslt
  icu
  libjpeg-turbo
  libpng
  libsndfile
  libsoxr
  libwebp
  openmp
  openssl
  rocblas
  rocprofiler
)
makedepends=(
  cmake
  cargo
  git
  hipcub
  pkgconf
  rocm-llvm
  rocprim
  rocwmma
)
# GCC host objects and ROCm Clang HIP objects use different LTO formats.
options=(!lto !debug)
source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  if [[ -z "${ROCM_PATH}" ]]; then
    source /etc/profile
  fi

  # HIP's __noinline__ macro conflicts with GCC 16's <format> attributes.
  # Load the standard header before HIP headers in host C++ translation units.
  CXXFLAGS+=' -include format'

  local _prefix_map="-ffile-prefix-map=${srcdir}=/usr/src/debug/${pkgname}"
  local _cmake_options=(
    -B build
    -S "${srcdir}/${_pkgname}"
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} ${_prefix_map}"
    -DCMAKE_HIP_FLAGS="${HIPFLAGS} ${_prefix_map}"
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_HIP_PLATFORM=amd
    -DCMAKE_HIP_ARCHITECTURES=gfx1151
    -DGPU_TARGETS=gfx1151
    -DENGINE_ENABLE_HIP=ON
    -DBUILD_TESTING=OFF
    -DGUFO_BUILD_TOOLS=ON
    -DGUFO_RELEASE_VERSION="${pkgver}"
    -DGUFO_REVISION="$(git -C "${srcdir}/${_pkgname}" rev-parse --short HEAD)"
    -DGUFO_FFMPEG_EXECUTABLE=/usr/bin/ffmpeg
    -DGUFO_FFPROBE_EXECUTABLE=/usr/bin/ffprobe
  )

  local _option
  for _option in GUFO_EXTENSION_DIRS GUFO_EXTENSIONS GUFO_EXTENSIONS_FROM_LOCK; do
    if [[ -v "${_option}" ]]; then
      msg2 "Applied custom CMake option: %s=%s" "${_option}" "${!_option}"
      _cmake_options+=("-D${_option}=${!_option}")
    fi
  done

  cmake "${_cmake_options[@]}"

  cmake --build build -- -j $(nproc)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

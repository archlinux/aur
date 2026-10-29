# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

_pkgname=gufo
pkgname=${_pkgname}-git
pkgver=0.26.0.r12.ge011849c
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
  libwebp
  openssl
  rocblas
  rocprofiler
)
makedepends=(
  cmake
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

  cmake -S "${srcdir}/${_pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_PREFIX_PATH=/opt/rocm \
    -DCMAKE_HIP_COMPILER=/opt/rocm/lib/llvm/bin/clang++ \
    -DCMAKE_HIP_ARCHITECTURES=gfx1151 \
    -DENGINE_ENABLE_HIP=ON \
    -DBUILD_TESTING=OFF \
    -DGUFO_BUILD_TOOLS=ON \
    -DGUFO_RELEASE_VERSION="${pkgver}" \
    -DGUFO_REVISION="$(git -C "${srcdir}/${_pkgname}" rev-parse --short HEAD)" \
    -DGUFO_FFMPEG_EXECUTABLE=/usr/bin/ffmpeg \
    -DGUFO_FFPROBE_EXECUTABLE=/usr/bin/ffprobe

  # Do not hardcode the --parallel value here.
  # Set MAKEFLAGS in /etc/makepkg.conf instead.
  cmake --build build -- -j $(nproc)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

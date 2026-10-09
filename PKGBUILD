# Maintainer: Radu Potop <radu@wooptoo.com>

pkgname=gufo
pkgver=0.10.0
pkgrel=1
pkgdesc="Fast inference engine for AMD Strix Halo (gfx1151)"
arch=(x86_64)
url='https://github.com/gufo-org/gufo'
license=('MIT')

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
)
makedepends=(
  cmake
  hipcub
  pkgconf
  rocm-llvm
  rocprim
  rocwmma
)
# GCC host objects and ROCm Clang HIP objects use different LTO formats.
options=(!lto !debug)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('b2711cd572e99f4e02d1f736c12688e4f5cbaaa6903cc3c1c337ddb024cb3a67')

build() {
  # HIP's __noinline__ macro conflicts with GCC 16's <format> attributes.
  # Load the standard header before HIP headers in host C++ translation units.
  CXXFLAGS+=' -include format'

  cmake -S "${srcdir}/${pkgname}-${pkgver}" -B build \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_PREFIX_PATH=/opt/rocm \
    -DCMAKE_HIP_COMPILER=/opt/rocm/lib/llvm/bin/clang++ \
    -DCMAKE_HIP_ARCHITECTURES=gfx1151 \
    -DENGINE_ENABLE_HIP=ON \
    -DBUILD_TESTING=OFF \
    -DGUFO_BUILD_TOOLS=OFF \
    -DGUFO_RELEASE_VERSION="${pkgver}" \
    -DGUFO_REVISION="v${pkgver}" \
    -DGUFO_FFMPEG_EXECUTABLE=/usr/bin/ffmpeg \
    -DGUFO_FFPROBE_EXECUTABLE=/usr/bin/ffprobe

  # Do not hardcode the --parallel value here.
  # Set MAKEFLAGS in /etc/makepkg.conf instead.
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
# vim:set ts=2 sw=2 et:

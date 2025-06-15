# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck/)

pkgname=libggml-hip-git
_pkgname="${pkgname%-git}"
pkgver=r2175.8cda0a3
pkgrel=1
pkgdesc='Tensor library for machine learning (with AMD ROCm optimizations)'
url='https://github.com/ggerganov/ggml'
license=('MIT')
arch=(x86_64)
depends=(
  gcc-libs
  glibc
  hip-runtime-amd
  hipblas
  openmp
  rocblas
)
makedepends=(
  cmake
  git
  rocm-hip-sdk
)
provides=(libggml "${_pkgname}")
conflicts=(libggml "${_pkgname}")
options=(lto)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  export CC=/opt/rocm/llvm/bin/clang
  export CXX=/opt/rocm/llvm/bin/clang++
  local _cmake_options=(
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_BUILD_TESTS=OFF
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    -DGGML_HIP=1
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

# check() {
#   ctest --test-dir build --output-on-failure
# }

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

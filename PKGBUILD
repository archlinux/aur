# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: redponike <proton dot me>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=mixbench-rocm-git
pkgver=0.228.v0.04.17.g32edeca
pkgrel=1
pkgdesc="GPU benchmark tool for evaluating GPUs on mixed operational intensity kernels (ROCm implementation)"
url="https://github.com/ekondis/mixbench"
license=('GPL-2.0-or-later')
arch=('x86_64')
makedepends=(
  git
  cmake
  ninja
  rocm-hip-sdk
)
depends=(
  hip-runtime-amd
  libstdc++
  glibc
  libgcc
)
_srcname="ekondis-mixbench"
source=("${_srcname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver () {
  cd "${_srcname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always --tags | sed 's|-|.|g')"
}

build() {
  cd "${_srcname}"

  local cmake_options=(
    -B build
    -G Ninja
    -S mixbench-hip
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    # -fcf-protection is not supported by HIP, see (Related docs were removed in version 6.2.4)
    # https://rocm.docs.amd.com/projects/llvm-project/en/docs-6.2.2/reference/rocmcc.html#support-status-of-other-clang-options
    -D CMAKE_CXX_FLAGS="${CXXFLAGS} -fcf-protection=none"
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  cd "${_srcname}"
  install -Dm755 "build/mixbench-hip" "${pkgdir}/usr/bin/mixbench-hip"
}

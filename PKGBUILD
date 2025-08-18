# Maintainer: robertfoster

pkgname=stable-diffusion.cpp-hipblas-git
pkgver=r256.5900ef6
pkgrel=1
pkgdesc="Stable Diffusion in pure C/C++ (with AMD ROCm optimizations)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/leejet/stable-diffusion.cpp"
license=("MIT")
depends=('hipblas')
makedepends=(
  'cmake'
  'git'
  'rocm-hip-sdk'
)
conflicts=("${pkgname%%-git}" 'stable-diffusion.cpp')
provides=("${pkgname%%-git}" 'stable-diffusion.cpp')
source=("${pkgname%%-git}::git+${url}"
  "git+https://github.com/ggerganov/ggml.git#commit=ff9052988b76e137bcf92bb335733933ca196ac0")

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%%-git}"
  git submodule init
  git config submodule.ggml.url "${srcdir}/ggml"
  git -c protocol.file.allow=always submodule update --remote
}

build() {
  export CXXFLAGS+="$CXXFLAGS -fcf-protection=none"
  export ROCM_PATH=/opt/rocm
  export PATH=$ROCM_PATH/bin:$PATH
  export LD_LIBRARY_PATH=$ROCM_PATH/lib:$ROCM_PATH/lib64:$LD_LIBRARY_PATH
  CC=/opt/rocm/llvm/bin/clang CXX=/opt/rocm/llvm/bin/clang++ \
    cmake \
    -B "${srcdir}/build" \
    -S "${srcdir}/${pkgname%%-git}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DGGML_HIP=1

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  rm "${pkgdir}/usr/include/"ggml*

  install -Dm644 "${srcdir}/${pkgname%%-git}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"

  rm -rf "${pkgdir}/usr/include/gguf.h"
  rm -rf "${pkgdir}/usr/lib/cmake/ggml/ggml-config.cmake"
  rm -rf "${pkgdir}/usr/lib/cmake/ggml/ggml-version.cmake"
  rm -rf "${pkgdir}"/usr/lib/*.a
}

sha256sums=('SKIP'
  'SKIP')

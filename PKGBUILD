# Maintainer: robertfoster

pkgname=ggml-hipblas-git
pkgver=r2100.6757e32
pkgrel=1
pkgdesc="Tensor library for machine learning (with AMD ROCm optimizations)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggml-org/ggml"
license=("MIT")
depends=('hipblas')
makedepends=(
  'cmake'
  'git'
  'rocm-hip-sdk'
)
conflicts=("${pkgname%%-git}" 'ggml' 'libggml')
provides=("${pkgname%%-git}" 'ggml' 'libggml')
source=("${pkgname%%-git}::git+${url}")

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  export CXXFLAGS+="$CXXFLAGS -fcf-protection=none"
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

  install -Dm644 "${srcdir}/${pkgname%%-git}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('SKIP')

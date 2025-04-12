# Maintainer: robertfoster

pkgname=stable-diffusion.cpp-cublas-git
pkgver=r211.10c6501
pkgrel=1
pkgdesc="Stable Diffusion in pure C/C++ (with NVIDIA CUDA optimizations)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/leejet/stable-diffusion.cpp"
license=("MIT")
depends=('cuda')
makedepends=(
  'cmake'
  'gcc13'
  'git'
)
conflicts=("${pkgname%%-git}" 'stable-diffusion.cpp')
conflicts=("${pkgname%%-git}" 'stable-diffusion.cpp')
source=("${pkgname%%-git}::git+${url}"
  "git+https://github.com/ggerganov/ggml.git")

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%%-git}"
  git submodule init
  git config submodule.ggml.url "${srcdir}/ggml"
  git -c protocol.file.allow=always submodule update
}

build() {
  export PATH+=":/opt/cuda/bin"
  export NVCC_CCBIN="gcc-13"
  cmake \
    -B "${srcdir}/build" \
    -S "${srcdir}/${pkgname%%-git}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DGGML_CUDA=1

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  rm "${pkgdir}/usr/include/"ggml*

  install -Dm644 "${srcdir}/${pkgname%%-git}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('SKIP'
  'SKIP')

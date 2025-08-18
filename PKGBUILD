# Maintainer: robertfoster

pkgname=stable-diffusion.cpp-git
pkgver=r256.5900ef6
pkgrel=1
pkgdesc="Stable Diffusion in pure C/C++"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/leejet/stable-diffusion.cpp"
license=("MIT")
depends=('openblas')
makedepends=(
  'cmake'
  'git'
)
conflicts=("${pkgname%%-git}")
provides=("${pkgname%%-git}")
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
  cmake \
    -B "${srcdir}/build" \
    -S "${srcdir}/${pkgname%%-git}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DGGML_BLAS=1 \
    -DGGML_BLAS_VENDOR=OpenBLAS

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

# Maintainer: robertfoster

pkgname=ggml-sycl-f32-git
pkgver=r2100.6757e32
pkgrel=1
pkgdesc="Tensor library for machine learning (with Intel SYCL GPU optimizations and F32)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggml-org/ggml"
license=("MIT")
depends=('intel-oneapi-basekit')
makedepends=(
  'cmake'
  'git'
)
conflicts=("${pkgname%%-git}" 'ggml' 'libggml')
provides=("${pkgname%%-git}" 'ggml' 'libggml')
source=("${pkgname%%-git}::git+${url}")

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  source /opt/intel/oneapi/setvars.sh
  cmake \
    -B "${srcdir}/build" \
    -S "${srcdir}/${pkgname%%-git}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER=icx \
    -DCMAKE_CXX_COMPILER=icpx \
    -DGGML_SYCL=1

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  install -Dm644 "${srcdir}/${pkgname%%-git}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('SKIP')

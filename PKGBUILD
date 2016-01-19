# Maintainer: Benjamin Chrétien <chretien dot b +aur at gmail dot com>
pkgname=benchmark
pkgver=1.0.0
pkgrel=2
pkgdesc="A microbenchmark support library, by Google"
arch=('any')
url="https://github.com/google/benchmark"
license=('Apache')
depends=()
makedepends=('cmake')

source=("https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d2206c263fc1a7803d4b10e164e0c225f6bcf0d5e5f20b87929f137dee247b54')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s|v0.0.0|v${pkgver}|g" "cmake/GetGitVersion.cmake"

  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=lib \
           -DBUILD_SHARED_LIBS=ON \
           -DBENCHMARK_ENABLE_LTO=ON
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir/" install
}

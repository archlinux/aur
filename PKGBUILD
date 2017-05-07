# Maintainer: Philipp Claen <philipp.classen@posteo.de>
pkgname=benchmark
pkgver=1.1.0
pkgrel=1
pkgdesc="A microbenchmark support library, by Google"
arch=('any')
url="https://github.com/google/benchmark"
license=('Apache')
depends=()
makedepends=('cmake')

source=("https://github.com/google/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e7334dd254434c6668e33a54c8f839194c7c61840d52f4b6258eee28e9f3b20e')

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

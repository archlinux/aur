# Maintainer: Erik Zenker <erikzenker at posteo dot de>
pkgname=benchmark-git
pkgver=v1.4.1.r19.g1f35fa4
pkgrel=1
pkgdesc="A microbenchmark support library, by Google"
arch=('i686' 'x86_64')
url="https://github.com/google/benchmark}"
license=('Apache')
depends=(gcc-libs gtest gmock)
makedepends=('cmake')

source=("${pkgname}::git+https://github.com/google/benchmark.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i "s|v0.0.0|v${pkgver}|g" "cmake/GetGitVersion.cmake"

  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_INSTALL_LIBDIR=lib \
           -DBUILD_SHARED_LIBS=ON \
           -DBENCHMARK_ENABLE_LTO=ON
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}/build"
  make
}

check() {
  cd "${srcdir}/${pkgname}/build"
  make test
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="$pkgdir/" install
}

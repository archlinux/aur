# Maintainer: Erik Zenker <erikzenker at posteo dot de>
pkgname=prometheus-cpp-git
pkgver=v0.r11.g250deb5
pkgrel=1
pkgdesc="Prometheus Client Library for Modern C++"
arch=('i686' 'x86_64')
url="https://github.com/jupp0r/prometheus-cpp.git"
license=('MIT')
depends=()
makedepends=('cmake' 'clang')

source=("${pkgname}::git+https://github.com/jupp0r/prometheus-cpp.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"

  git submodule init
  git submodule update

  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}/build"
  cmake --build .
}

check() {
  cd "${srcdir}/${pkgname}/build"
  ctest -VV
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="$pkgdir/" install
}

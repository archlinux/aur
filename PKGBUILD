# Maintainer: Erik Zenker <erikzenker at posteo dot de>
pkgname=asyncly-git
pkgver=heads.makepkg.r0.g2698c97
pkgrel=1
pkgdesc="This library implements task executors and higher level primitives built on them"
arch=('i686' 'x86_64')
url="https://github.com/erikzenker/asyncly.git"
license=('MIT')
depends=('boost' 'function2-git' 'prometheus-cpp-git' 'gmock' 'gtest')
makedepends=('cmake' 'clang')

source=("${pkgname}::git+https://github.com/erikzenker/asyncly.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DENABLE_TESTING=ON \
           -DBUILD_SHARED_LIBS=OFF \
           -DENABLE_BENCHMARK=OFF
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --all --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/\//./g'
}

build() {
  cd "${srcdir}/${pkgname}/build"
  cmake --build .
}

check() {
  cd "${srcdir}/${pkgname}/build"
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="$pkgdir/" install
}

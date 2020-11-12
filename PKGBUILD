# Maintainer: Erik Zenker <erikzenker at posteo dot de>
pkgname=asyncly-git
pkgver=heads.makepkg.r0.ga0dad4a
pkgrel=1
pkgdesc="This library implements task executors and higher level primitives built on them"
arch=('i686' 'x86_64')
url="https://github.com/erikzenker/asyncly.git"
license=('MIT')
depends=('boost' 'function2-git' 'prometheus-cpp-git')
makedepends=('cmake' 'clang')

source=("${pkgname}::git+https://github.com/erikzenker/asyncly.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  
  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DENABLE_TESTING=OFF
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
  ctest -VV
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="$pkgdir/" install
}

# Maintainer: Erik Zenker <erikzenker at posteo dot de>
pkgname=q-git
pkgver=r405.ad0d31b
pkgrel=1
pkgdesc="A platform-independent promise library for C++, implementing asynchronous continuations"
arch=('i686' 'x86_64')
url="https://github.com/google/benchmark}"
license=('Apache')
depends=(gcc-libs)
makedepends=('cmake')

source=("${pkgname}::git+https://github.com/grantila/q.git")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"

  mkdir -p build && cd build

  cmake .. -DCMAKE_BUILD_TYPE="Release" \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DBUILD_SHARED_LIBS=ON \
           -Dq_BUILD_TESTS=OFF
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}/build"
  make -j
}

check() {
  cd "${srcdir}/${pkgname}/build"
  ctest
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="$pkgdir/" install
}

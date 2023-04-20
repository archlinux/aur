# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

pkgname=libcollectc-git
pkgver=r616.2302fff
pkgrel=1
pkgdesc='A library of generic data structures.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/srdja/Collections-C'
license=('LGPL3')
depends=('glibc')
makedepends=('git' 'cmake' 'cpputest')
provides=('libcollectc' 'libcollectc.so')
source=('libcollectc-git::git+https://github.com/srdja/Collections-C.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake \
    -B "${pkgname}/build" \
    -S "${pkgname}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Wno-dev
  cmake --build "${pkgname}/build"
}

check() {
  cd "${pkgname}"
  ctest --test-dir build --output-on-failure --stop-on-failure -j1
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${pkgname}/build"
}


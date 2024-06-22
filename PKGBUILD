# Maintainer: Kino <cybao292261@163.com>
# Maintainer: Kartik Mohta <kartikmohta@gmail.com>
pkgname=g2o
pkgver=20230806_git
pkgrel=1
pkgdesc="A General Framework for Graph Optimization"
arch=('i686' 'x86_64' 'armv7')
url="https://github.com/RainerKuemmerle/g2o"
license=('BSD-3-Clause')
makedepends=('cmake')
depends=('eigen' 'fmt' 'glu' 'spdlog' 'suitesparse')
optdepends=('libqglviewer: for building the g2o_viewer app')
conflicts=('g2o-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RainerKuemmerle/g2o/archive/${pkgver}.tar.gz"
        "https://github.com/RainerKuemmerle/g2o/pull/808.patch")
sha256sums=('e717d3b96cc6d00fcbbaf637aae648c9823599e6aa8fcf4546fc9ad4034dcde5'
            'b952cd113ed1f9803ed7b618f37c0aecd3b0945e2e70a7b5dd355413ecccd363')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < ../808.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE=Release \
        -DG2O_BUILD_APPS=ON \
        -DG2O_BUILD_EXAMPLES=OFF \
        -DBUILD_UNITTESTS=ON \
        -Wno-dev
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# Maintainer: Kino <cybao292261@163.com>
# Maintainer: Kartik Mohta <kartikmohta@gmail.com>
pkgname=g2o
pkgver=20230806
pkgrel=2
pkgdesc="A General Framework for Graph Optimization"
arch=('i686' 'x86_64' 'armv7' 'aarch64')
url="https://github.com/RainerKuemmerle/g2o"
license=('BSD-3-Clause' 'GPL-3.0-or-later' 'LGPL-2.1-or-later')
makedepends=('cmake')
depends=('eigen' 'fmt' 'glu' 'spdlog' 'suitesparse' 'libqglviewer-qt5')
conflicts=('g2o-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RainerKuemmerle/g2o/archive/${pkgver}_git.tar.gz"
        "https://github.com/RainerKuemmerle/g2o/pull/808.patch"
        "https://github.com/RainerKuemmerle/g2o/pull/826.patch")
sha256sums=('e717d3b96cc6d00fcbbaf637aae648c9823599e6aa8fcf4546fc9ad4034dcde5'
            'b952cd113ed1f9803ed7b618f37c0aecd3b0945e2e70a7b5dd355413ecccd363'
            'b76a9dc4fe80036a23c60fae1e050ff267bf9b255e53b2dde7fa073aec7f2b69')

prepare() {
  cd "$pkgname-$pkgver"_git
  patch -Np1 < ../808.patch
  patch -Np1 < ../826.patch || true

  sed -i "29a\#include <algorithm>\\n#include <iterator>" $srcdir/$pkgname-${pkgver}_git/g2o/stuff/string_tools.h
  sed -i "s|fmt::join(ids, \" \")|strJoin(ids.begin(), ids.end(), \" \")|g" $srcdir/$pkgname-${pkgver}_git/g2o/core/optimizable_graph.cpp
}

build() {
  cmake -B build -S $pkgname-${pkgver}_git \
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
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}_git/doc/license-bsd.txt ${pkgdir}/usr/share/licenses/${pkgname}/license-bsd.txt
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}_git/doc/license-gpl.txt ${pkgdir}/usr/share/licenses/${pkgname}/license-gpl.txt
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}_git/doc/license-lgpl.txt ${pkgdir}/usr/share/licenses/${pkgname}/license-lgpl.txt
}

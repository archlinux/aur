# Maintainer: Kino <cybao292261 at 163 dot com>

pkgname=sophus
pkgver=22.10
pkgrel=1
pkgdesc="C++ implementation of Lie Groups using Eigen"
arch=('x86_64' 'i686')
url="https://github.com/strasdat/Sophus"
license=('BSD')
depends=('eigen' 'fmt')
optdepends=()
makedepends=('cmake')
conflicts=()
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "sophus-fix-missing-sophus_func.patch")
sha256sums=('270709b83696da179447cf743357e36a8b9bc8eed5ff4b9d66d33fe691010bad'
            'd8d623a5381bc92f2992b3435cbc88f52ae3b2d600f0684b308b978b22eb53cf')

prepare() {
  cd "Sophus-$pkgver"

  # Fix missing SOPHUS_FUNC in QuaternionProduct,so3.hpp
  # https://hub.nuaa.cf/strasdat/Sophus/commit/1cba0d82cd224c7b3694d601f8c9cddc0876b42b
  patch -p1 < ../sophus-fix-missing-sophus_func.patch
}

build() {
  cd "Sophus-$pkgver"

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_STANDARD=14 \
        -DBUILD_SOPHUS_TESTS=OFF \
        -DBUILD_SOPHUS_EXAMPLES=OFF \
        ..

  make
}

package() {
  cd "Sophus-$pkgver"/build
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:

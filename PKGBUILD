# Maintainer: Kino <cybao292261 at 163 dot com>
# Contributor: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=xacro
pkgname=ros2-humble-xacro
pkgver=2.0.9
pkgrel=5
pkgdesc="A tool to construct shorter and more readable XML files by using macros that expand to larger XML expressions"
url="https://index.ros.org/p/xacro/"
license=('BSD-3-Clause')
arch=('any')
makedepends=('cmake')
depends=(
    'ros2-humble'
    'python-yaml'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ros/xacro/archive/${pkgver}.tar.gz"
        "support-python3.12.patch")
sha256sums=('a8802a5b48f7479bae1238e822ac4ebb47660221eb9bc40a608e899d60f3f7e4'
            '96a0669a1c2190e49d2dd93f7f2fea534d699bb32b96c0d02760041f89cb2836')

prepare() {
  cd $srcdir/xacro-$pkgver
  patch -p1 < ../support-python3.12.patch
}

build() {
  source /opt/ros/humble/setup.bash

  cmake -B build -S "$_pkgname-$pkgver" \
      -DCMAKE_BUILD_TYPE='None' \
      -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
      -Wno-dev

  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $srcdir/xacro-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# Maintainer: Kodate Mitsuru <hh178239456@gmail.com>
# Contributor: Kino <cybao292261@163.com>
# Contributor: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=ament_lint
_pkgname=ament_cmake_mypy
pkgname=ros2-jazzy-ament_cmake_mypy
pkgver=0.17.2
pkgrel=1
pkgdesc="The CMake API for ament_mypy to perform static type analysis on python code with mypy."
url="https://github.com/ament/ament_lint"
license=('Apache-2.0')
arch=('any')
makedepends=('cmake')
depends=('boost' 'ros2-jazzy')
checkdepends=('gtest' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ament/ament_lint/archive/${pkgver}.tar.gz")
sha256sums=('1404cdea90e26392e55e2e5b78e00b7c78df29ca9ae7373ddf67c331535d81e9')

prepare() {
  mkdir -p $srcdir/build
  cd $srcdir/build
  source /opt/ros/jazzy/setup.bash
  python -m venv venv/opt/ros/jazzy --system-site-packages
}

build() {
  source build/venv/opt/ros/jazzy/bin/activate
  cmake -B build -S "$_pkgroot-$pkgver/$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/jazzy/' \
        -Wno-dev
  cmake --build build
  deactivate
}

check() {
  cd $srcdir/build
  export LD_LIBRARY_PATH=$PWD/venv/opt/ros/jazzy/lib
  cmake --install . --prefix venv/opt/ros/jazzy
  source venv/opt/ros/jazzy/bin/activate
  ctest --output-on-failure
  deactivate
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $srcdir/$_pkgroot-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
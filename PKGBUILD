# Maintainer: Kodate Mitsuru <hh178239456@gmail.com>
# Contributor: Kino <cybao292261@163.com>
# Contributor: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=vision_opencv
_pkgname=cv_bridge
pkgname=ros2-jazzy-cv-bridge
pkgver=4.1.0
pkgrel=1
pkgdesc="This contains CvBridge, which converts between ROS Image messages and OpenCV images."
url="https://index.ros.org/p/cv_bridge/"
license=('Apache-2.0' 'BSD-3-Clause')
arch=('any')
makedepends=('cmake')
depends=('boost' 'opencv' 'python-numpy' 'python-opencv' 'ros2-jazzy')
checkdepends=('gtest' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ros-perception/vision_opencv/archive/${pkgver}.tar.gz")
sha256sums=('9b62869915c450d9477d0a4e5b8d1ba4686772d51fb0b379835c3fd465c37ec1')

prepare() {
  mkdir -p $srcdir/build
  cd $srcdir/build
  source /opt/ros/jazzy/setup.bash
  python -m venv venv/opt/ros/jazzy --system-site-packages

  # JASPER is enabled by default on Arch Linux.
  sed -i "s/'tiff'\]/'tiff', 'jp2'\]/g" $srcdir/$_pkgroot-$pkgver/$_pkgname/test/conversions.py

  # Fix for NumPy 2.0
  sed -i "s/newbyteorder()/view(im.dtype.newbyteorder())/g" \
         $srcdir/$_pkgroot-$pkgver/$_pkgname/python/cv_bridge/core.py
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
  install -Dm644 $srcdir/$_pkgroot-$pkgver/LICENSE-Apache $pkgdir/usr/share/licenses/$pkgname/LICENSE-Apache
  install -Dm644 $srcdir/$_pkgroot-$pkgver/LICENSE-BSD $pkgdir/usr/share/licenses/$pkgname/LICENSE-BSD
}

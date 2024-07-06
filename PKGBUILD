# Maintainer: Kino <cybao292261@163.com>
# Contributor: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=vision_opencv
_pkgname=cv_bridge
pkgname=ros2-humble-cv-bridge
pkgver=3.2.1
pkgrel=10
pkgdesc="This contains CvBridge, which converts between ROS Image messages and OpenCV images."
url="https://index.ros.org/p/cv_bridge/"
license=('Apache-2.0' 'BSD-3-Clause')
arch=('any')
makedepends=('cmake')
depends=('boost' 'opencv' 'python-numpy' 'python-opencv' 'ros2-humble')
checkdepends=('gtest' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ros-perception/vision_opencv/archive/${pkgver}.tar.gz")
sha256sums=('bf8a18770ffe3335e9bf96cb89be886a846be10382e67c2dc93cd4e387b2c3f9')

prepare() {
  mkdir -p $srcdir/build
  cd $srcdir/build
  source /opt/ros/humble/setup.bash
  python -m venv venv/opt/ros/humble --system-site-packages

  # JASPER is enabled by default on Arch Linux.
  sed -i "s/'tiff'\]/'tiff', 'jp2'\]/g" $srcdir/$_pkgroot-$pkgver/$_pkgname/test/conversions.py

  # Fix for NumPy 2.0
  sed -i "s/newbyteorder()/view(im.dtype.newbyteorder())/g" \
         $srcdir/$_pkgroot-$pkgver/$_pkgname/python/cv_bridge/core.py
}

build() {
  source build/venv/opt/ros/humble/bin/activate
  cmake -B build -S "$_pkgroot-$pkgver/$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
  cmake --build build
  deactivate
}

check() {
  cd $srcdir/build
  export LD_LIBRARY_PATH=$PWD/venv/opt/ros/humble/lib
  cmake --install . --prefix venv/opt/ros/humble
  source venv/opt/ros/humble/bin/activate
  ctest --output-on-failure
  deactivate
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $srcdir/$_pkgroot-$pkgver/LICENSE-Apache $pkgdir/usr/share/licenses/$pkgname/LICENSE-Apache
  install -Dm644 $srcdir/$_pkgroot-$pkgver/LICENSE-BSD $pkgdir/usr/share/licenses/$pkgname/LICENSE-BSD
}

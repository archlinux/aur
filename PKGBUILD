# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Library for visual odometry"
url='https://www.wiki.ros.org/viso2'

pkgname='ros-melodic-libviso2'
pkgver='0.0.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPL')

makedepends=('cmake' 'gcc-libs')
depends=('gcc-libs')

_dir="viso2/libviso2"
source=("viso2"::"git+https://github.com/srv/viso2.git")
sha256sums=('SKIP')

prepare() {
  sed -i -e "/install(DIRECTORY/s/$/\//" -e "/PATTERN/s/.cpp/*.cpp/" ${srcdir}/${_dir}/CMakeLists.txt
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7.so \
        -DPYTHON_BASENAME=-python3.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

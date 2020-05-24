# Maintainer: michaelchou <michaeljchou at the hotmail domain which is .com>
# Contributor: michaelchou <michaeljchou at the hotmail domain which is .com>

pkgname=ros-noetic-socketcan-interface
pkgdesc='Generic CAN interface description with helpers for filtering and driver implementation. Further a socketcan implementation based on boost::asio is included.'
url="http://wiki.ros.org/socketcan_interface?distro=noetic"

pkgver='0.8.1'
pkgrel=3
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
license=('LGPL3')

ros_makedepends=( ros-noetic-catkin
)
makedepends=(cmake ros-build-tools ${ros_makedepends[@]})

ros_depends=(
  ros-noetic-class-loader
)
depends=(boost linux-headers ${ros_depends[@]})

_dir="ros_canopen-${pkgver}/socketcan_interface"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-industrial/ros_canopen/archive/${pkgver}.tar.gz")
sha256sums=('aa75077452abea1848405906c989eca2e539943c2d1cc1e6f1d72f8facc74390')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}/" install
}

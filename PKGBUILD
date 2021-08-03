# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - The robot_localization package provides nonlinear state estimation through sensor fusion of an abritrary number of sensors."
url='https://wiki.ros.org/robot_localization'

pkgname='ros-noetic-robot-localization'
pkgver='2.7.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-tf2-ros
  ros-noetic-geographic-msgs
  ros-noetic-diagnostic-updater
  ros-noetic-roscpp
  ros-noetic-geometry-msgs
  ros-noetic-std-msgs
  ros-noetic-diagnostic-msgs
  ros-noetic-message-filters
  ros-noetic-message-generation
  ros-noetic-sensor-msgs
  ros-noetic-cmake-modules
  ros-noetic-catkin
  ros-noetic-tf2-geometry-msgs
  ros-noetic-nav-msgs
  ros-noetic-tf2
  ros-noetic-roslint
  ros-noetic-eigen-conversions)
makedepends=('ros-build-tools'
  ${ros_makedepends[@]}
  geographiclib
  eigen
  cmake)

ros_depends=(ros-noetic-tf2-ros
  ros-noetic-geographic-msgs
  ros-noetic-diagnostic-updater
  ros-noetic-roscpp
  ros-noetic-geometry-msgs
  ros-noetic-std-msgs
  ros-noetic-message-runtime
  ros-noetic-diagnostic-msgs
  ros-noetic-message-filters
  ros-noetic-sensor-msgs
  ros-noetic-cmake-modules
  ros-noetic-tf2-geometry-msgs
  ros-noetic-nav-msgs
  ros-noetic-tf2
  ros-noetic-eigen-conversions)
depends=(${ros_depends[@]}
  geographiclib
  eigen)

_dir="robot_localization-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/cra-ros-pkg/robot_localization/archive/${pkgver}.tar.gz")
sha256sums=('aa940144f87d3787aba59123c7d220b27c76ce707747f41bbb5720dfab2d5075')

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
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

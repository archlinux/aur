pkgdesc="ROS - The robot_localization package provides nonlinear state estimation through sensor fusion of an abritrary number of sensors."
url='https://wiki.ros.org/robot_localization'

pkgname='ros-noetic-robot-localization'
pkgver='2.7.4'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
  ros-noetic-catkin
  ros-noetic-message-generation
  ros-noetic-roslint
)
makedepends=(
  cmake
  ros-build-tools
  ${ros_makedepends[@]}
  eigen
  geographiclib
  python-catkin_pkg
)

ros_depends=(
  ros-noetic-cmake-modules
  ros-noetic-diagnostic-msgs
  ros-noetic-diagnostic-updater
  ros-noetic-eigen-conversions
  ros-noetic-geographic-msgs
  ros-noetic-geometry-msgs
  ros-noetic-message-filters
  ros-noetic-nav-msgs
  ros-noetic-nodelet
  ros-noetic-roscpp
  ros-noetic-sensor-msgs
  ros-noetic-std-msgs
  ros-noetic-std-srvs
  ros-noetic-tf2
  ros-noetic-tf2-geometry-msgs
  ros-noetic-tf2-ros
)
depends=(
  ${ros_depends[@]}
  geographiclib
  eigen
  yaml-cpp
)

_dir="robot_localization-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/cra-ros-pkg/robot_localization/archive/${pkgver}.tar.gz")
sha256sums=('3f4b7d681430840a4adfb91b26231262114630ba5229a626b43ecf2cf95fc038')

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

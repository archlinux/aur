# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - The robot_localization package provides nonlinear state estimation through sensor fusion of an abritrary number of sensors."
url='https://wiki.ros.org/robot_localization'

pkgname='ros-melodic-robot-localization'
pkgver='2.5.2'
_pkgver_patch=1
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-tf2-ros
  ros-melodic-geographic-msgs
  ros-melodic-diagnostic-updater
  ros-melodic-roscpp
  ros-melodic-geometry-msgs
  ros-melodic-std-msgs
  ros-melodic-diagnostic-msgs
  ros-melodic-message-filters
  ros-melodic-message-generation
  ros-melodic-sensor-msgs
  ros-melodic-cmake-modules
  ros-melodic-catkin
  ros-melodic-tf2-geometry-msgs
  ros-melodic-nav-msgs
  ros-melodic-tf2
  ros-melodic-roslint
  ros-melodic-eigen-conversions)
makedepends=('ros-build-tools'
  ${ros_makedepends[@]}
  eigen3
  cmake)

ros_depends=(ros-melodic-tf2-ros
  ros-melodic-geographic-msgs
  ros-melodic-diagnostic-updater
  ros-melodic-roscpp
  ros-melodic-geometry-msgs
  ros-melodic-std-msgs
  ros-melodic-message-runtime
  ros-melodic-diagnostic-msgs
  ros-melodic-message-filters
  ros-melodic-sensor-msgs
  ros-melodic-cmake-modules
  ros-melodic-tf2-geometry-msgs
  ros-melodic-nav-msgs
  ros-melodic-tf2
  ros-melodic-eigen-conversions)
depends=(${ros_depends[@]}
  eigen3)

_dir="robot_localization-release-release-melodic-robot_localization-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/cra-ros-pkg/robot_localization-release/archive/release/melodic/robot_localization/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('708fc8891bc3952c4093f055cc2ed9b96d39935a80d85dd5262f9f6ef98e25f7')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=-python3.7m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

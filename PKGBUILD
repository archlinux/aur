# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Bound incoming velocity messages according to robot velocity and acceleration limits."
url='https://wiki.ros.org/yocs_velocity_smoother'

pkgname='ros-noetic-yocs-velocity-smoother'
pkgver='0.8.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-noetic-roscpp
  ros-noetic-ecl-threads
  ros-noetic-geometry-msgs
  ros-noetic-catkin
  ros-noetic-dynamic-reconfigure
  ros-noetic-nav-msgs
  ros-noetic-pluginlib
  ros-noetic-nodelet)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-roscpp
  ros-noetic-ecl-threads
  ros-noetic-geometry-msgs
  ros-noetic-dynamic-reconfigure
  ros-noetic-nav-msgs
  ros-noetic-pluginlib
  ros-noetic-nodelet)
depends=(${ros_depends[@]})

_dir="yujin_ocs-${pkgver}/yocs_velocity_smoother"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/yujinrobot/yujin_ocs/archive/${pkgver}.tar.gz")
sha256sums=('cb81a2590558b7513f28ef8f9c9571ba9eeb1cae03d2db4c52b0509a70804001')

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

pkgdesc="ROS - ros_control controller manager interface for MoveIt!."
url='https://wiki.ros.org/moveit_ros_control_interface'

pkgname='ros-noetic-moveit-ros-control-interface'
pkgver='1.1.8'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-moveit-core
  ros-noetic-trajectory-msgs
  ros-noetic-moveit-simple-controller-manager
  ros-noetic-controller-manager-msgs
  ros-noetic-pluginlib
  ros-noetic-actionlib
  ros-noetic-catkin)
makedepends=(cmake ros-build-tools
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-moveit-core
  ros-noetic-trajectory-msgs
  ros-noetic-moveit-simple-controller-manager
  ros-noetic-controller-manager-msgs
  ros-noetic-pluginlib
  ros-noetic-actionlib)
depends=(${ros_depends[@]})

_dir="moveit-${pkgver}/moveit_plugins/moveit_ros_control_interface"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('2a88440169593037c4adbf14896c30def63f8b3af85f1239e8ef94ee62b0b969')

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

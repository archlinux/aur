# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Components of MoveIt that offer visualization."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-ros-visualization'
pkgver='1.0.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-object-recognition-msgs
  ros-noetic-pluginlib
  ros-noetic-moveit-ros-warehouse
  ros-noetic-interactive-markers
  ros-noetic-rospy
  ros-noetic-roscpp
  ros-noetic-moveit-ros-planning-interface
  ros-noetic-rviz
  ros-noetic-moveit-ros-robot-interaction
  ros-noetic-geometric-shapes
  ros-noetic-catkin
  ros-noetic-moveit-ros-perception)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3
  pkg-config)

ros_depends=(ros-noetic-object-recognition-msgs
  ros-noetic-pluginlib
  ros-noetic-moveit-ros-warehouse
  ros-noetic-interactive-markers
  ros-noetic-rospy
  ros-noetic-roscpp
  ros-noetic-moveit-ros-planning-interface
  ros-noetic-rviz
  ros-noetic-moveit-ros-robot-interaction
  ros-noetic-geometric-shapes
  ros-noetic-moveit-ros-perception)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/moveit_ros_visualization/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('648a7419c00fa9e0d6575e1d7afa381dfe33cdcfe83348a8145c23801ecb80dd')

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_ros/visualization"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('b8194308c57dbe34bbb729cfccb30d1113af3a54a90a2cfb49482142d1044ea4')

prepare() {
  sed -i "/#include <moveit\/macros\/class_forward.h/i#include <boost\/thread\/mutex.hpp>" ${srcdir}/${_dir}/rviz_plugin_render_tools/include/moveit/rviz_plugin_render_tools/trajectory_visualization.h
}

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

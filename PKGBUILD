# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Components of MoveIt that offer visualization."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-ros-visualization'
pkgver='0.10.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-object-recognition-msgs
  ros-melodic-pluginlib
  ros-melodic-moveit-ros-warehouse
  ros-melodic-interactive-markers
  ros-melodic-rospy
  ros-melodic-roscpp
  ros-melodic-moveit-ros-planning-interface
  ros-melodic-rviz
  ros-melodic-moveit-ros-robot-interaction
  ros-melodic-geometric-shapes
  ros-melodic-catkin
  ros-melodic-moveit-ros-perception)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3
  pkg-config)

ros_depends=(ros-melodic-object-recognition-msgs
  ros-melodic-pluginlib
  ros-melodic-moveit-ros-warehouse
  ros-melodic-interactive-markers
  ros-melodic-rospy
  ros-melodic-roscpp
  ros-melodic-moveit-ros-planning-interface
  ros-melodic-rviz
  ros-melodic-moveit-ros-robot-interaction
  ros-melodic-geometric-shapes
  ros-melodic-moveit-ros-perception)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_ros_visualization/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('648a7419c00fa9e0d6575e1d7afa381dfe33cdcfe83348a8145c23801ecb80dd')

# Tarball version (faster download)
_dir="moveit-release-release-melodic-moveit_ros_visualization-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/melodic/moveit_ros_visualization/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('54d8419a104129bdef52320a2aec6214b20f29362e72a206b76833b6771cead8')

prepare() {
  sed -i "/#include <moveit\/macros\/class_forward.h/i#include <boost\/thread\/mutex.hpp>" ${srcdir}/${_dir}/rviz_plugin_render_tools/include/moveit/rviz_plugin_render_tools/trajectory_visualization.h
}

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

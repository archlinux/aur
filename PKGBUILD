# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - This package provides implementations of the Trajectory Rollout and Dynamic Window approaches to local robot navigation on a plane."
url='https://wiki.ros.org/base_local_planner'

pkgname='ros-melodic-base-local-planner'
pkgver='1.16.2'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-angles
  ros-melodic-angles
  ros-melodic-catkin
  ros-melodic-cmake-modules
  ros-melodic-costmap-2d
  ros-melodic-dynamic-reconfigure
  ros-melodic-geometry-msgs
  ros-melodic-message-generation
  ros-melodic-nav-core
  ros-melodic-nav-msgs
  ros-melodic-pluginlib
  ros-melodic-rosconsole
  ros-melodic-roscpp
  ros-melodic-rospy
  ros-melodic-sensor-msgs
  ros-melodic-std-msgs
  ros-melodic-tf2
  ros-melodic-tf2-geometry-msgs
  ros-melodic-tf2-ros
  ros-melodic-visualization-msgs
  ros-melodic-voxel-grid)
makedepends=('cmake' 'ros-build-tools' 'eigen3'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-angles
  ros-melodic-angles
  ros-melodic-catkin
  ros-melodic-costmap-2d
  ros-melodic-dynamic-reconfigure
  ros-melodic-geometry-msgs
  ros-melodic-message-generation
  ros-melodic-nav-core
  ros-melodic-nav-msgs
  ros-melodic-pluginlib
  ros-melodic-rosconsole
  ros-melodic-roscpp
  ros-melodic-rospy
  ros-melodic-sensor-msgs
  ros-melodic-std-msgs
  ros-melodic-tf2
  ros-melodic-tf2-ros
  ros-melodic-visualization-msgs
  ros-melodic-voxel-grid)
depends=(${ros_depends[@]} 'eigen3')

# Git version (e.g. for debugging)
# _tag=release/melodic/base_local_planner/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-melodic-base_local_planner-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/melodic/base_local_planner/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('1c14d73638bd309260ffb06d9a97853ab875b6ab6d6e6723ca8398f6ae0d58a8')

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

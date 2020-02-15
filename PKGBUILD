# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - This package provides implementations of the Trajectory Rollout and Dynamic Window approaches to local robot navigation on a plane."
url='https://wiki.ros.org/base_local_planner'

pkgname='ros-melodic-base-local-planner'
pkgver='1.16.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=14
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
_dir="navigation-${pkgver}/base_local_planner"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/navigation/archive/${pkgver}.tar.gz")
sha256sums=('d83201296e773e2789635fddf39ac18e9465219b18707e53bd2361de4762d205')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

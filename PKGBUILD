# Maintainer: Firas Zaidan <firas@zaidan.de>
pkgdesc="ROS - The move_base package provides an implementation of an action (see the actionlib package) that, given a goal in the world, will attempt to reach it with a mobile base."
url='http://wiki.ros.org/move_base'

pkgname='ros-kinetic-move-base'
pkgver='1.14.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-nav-core
  ros-kinetic-tf
  ros-kinetic-catkin
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-std-msgs
  ros-kinetic-rotate-recovery
  ros-kinetic-base-local-planner
  ros-kinetic-clear-costmap-recovery
  ros-kinetic-rospy
  ros-kinetic-navfn
  ros-kinetic-costmap-2d
  ros-kinetic-message-generation
  ros-kinetic-std-srvs
  ros-kinetic-actionlib
  ros-kinetic-visualization-msgs
  ros-kinetic-move-base-msgs
  ros-kinetic-cmake-modules
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-nav-msgs
  ros-kinetic-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-nav-core
  ros-kinetic-navfn
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-message-runtime
  ros-kinetic-base-local-planner
  ros-kinetic-clear-costmap-recovery
  ros-kinetic-rospy
  ros-kinetic-std-msgs
  ros-kinetic-costmap-2d
  ros-kinetic-nav-msgs
  ros-kinetic-std-srvs
  ros-kinetic-actionlib
  ros-kinetic-visualization-msgs
  ros-kinetic-move-base-msgs
  ros-kinetic-tf
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-rotate-recovery
  ros-kinetic-pluginlib)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/move_base/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-kinetic-move_base-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/kinetic/move_base/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('c768c60913da1102499855e0b2bb6b0db241a67506654e34d631057836b4dc50')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

# Maintainer: Firas Zaidan <firas@zaidan.de>
pkgdesc="ROS - A 2D navigation stack that takes in information from odometry, sensor streams, and a goal pose and outputs safe velocity commands that are sent to a mobile base."
url='http://wiki.ros.org/navigation'

pkgname='ros-kinetic-navigation'
pkgver='1.14.2'
_pkgver_patch=0
arch=('any')
pkgrel=0
license=('BSD,LGPL,LGPL (amcl)')

ros_makedepends=(ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-nav-core
  ros-kinetic-carrot-planner
  ros-kinetic-fake-localization
  ros-kinetic-clear-costmap-recovery
  ros-kinetic-base-local-planner
  ros-kinetic-amcl
  ros-kinetic-navfn
  ros-kinetic-global-planner
  ros-kinetic-map-server
  ros-kinetic-voxel-grid
  ros-kinetic-dwa-local-planner
  ros-kinetic-robot-pose-ekf
  ros-kinetic-move-base-msgs
  ros-kinetic-move-slow-and-clear
  ros-kinetic-costmap-2d
  ros-kinetic-rotate-recovery
  ros-kinetic-move-base)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/navigation/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-kinetic-navigation-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/kinetic/navigation/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('29b9b7e32ff22c2670b7bfffbc08d37fae07ca1c7119d1ae221de8ed8cfce029')

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

# Maintainer: Firas Zaidan <firas@zaidan.de>
pkgdesc="ROS - This package provides an implementation of the Dynamic Window Approach to local robot navigation on a plane."
url='http://wiki.ros.org/dwa_local_planner'

pkgname='ros-kinetic-dwa-local-planner'
pkgver='1.14.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-nav-core
  ros-kinetic-tf
  ros-kinetic-roscpp
  ros-kinetic-base-local-planner
  ros-kinetic-costmap-2d
  ros-kinetic-pcl-conversions
  ros-kinetic-catkin
  ros-kinetic-cmake-modules
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-nav-msgs
  ros-kinetic-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3)

ros_depends=(ros-kinetic-nav-core
  ros-kinetic-tf
  ros-kinetic-roscpp
  ros-kinetic-base-local-planner
  ros-kinetic-costmap-2d
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-nav-msgs
  ros-kinetic-pluginlib)
depends=(${ros_depends[@]}
  eigen3)

# Git version (e.g. for debugging)
# _tag=release/kinetic/dwa_local_planner/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-kinetic-dwa_local_planner-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/kinetic/dwa_local_planner/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('9e5ba3091b957a7ed2cc59efb64a1c3a1f5c792fb23611e3dbe725e8721c6d99')

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

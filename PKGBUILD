# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Persistent storage of ROS messages."
url='http://ros.org/wiki/warehouse_ros'

pkgname='ros-kinetic-warehouse-ros'
pkgver='0.9.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-tf
  ros-kinetic-geometry-msgs
  ros-kinetic-roscpp
  ros-kinetic-rostime
  ros-kinetic-std-msgs
  ros-kinetic-pluginlib
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-tf
  ros-kinetic-geometry-msgs
  ros-kinetic-roscpp
  ros-kinetic-rostime
  ros-kinetic-std-msgs
  ros-kinetic-pluginlib)
depends=(${ros_depends[@]}
  boost)

# Git version (e.g. for debugging)
# _tag=release/kinetic/warehouse_ros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/warehouse_ros-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="warehouse_ros-release-release-kinetic-warehouse_ros-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/warehouse_ros-release/archive/release/kinetic/warehouse_ros/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('5b2103e38a4f57ee000f2b81b3b74238b7f3a44be07ab4e856a60e44d870f281')

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

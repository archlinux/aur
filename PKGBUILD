# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Persistent storage of ROS data using MongoDB."
url='http://ros.org/wiki/warehouse_ros'

pkgname='ros-indigo-warehouse-ros'
pkgver='0.8.8'
_pkgver_patch=0
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-rostest
  ros-indigo-rostime
  ros-indigo-rospy
  ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  mongodb
  mongo-cxx-driver-legacy-0.0-26compat
  curl
  python2-pymongo
  openssl)

ros_depends=(ros-indigo-std-msgs
  ros-indigo-rostime
  ros-indigo-roscpp
  ros-indigo-geometry-msgs)
depends=(${ros_depends[@]}
  mongodb
  mongo-cxx-driver-legacy-0.0-26compat
  curl
  python2-pymongo
  openssl)

_tag=release/indigo/warehouse_ros/${pkgver}-${_pkgver_patch}
_dir=warehouse_ros
source=("${_dir}"::"git+https://github.com/ros-gbp/warehouse_ros-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-lpython2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

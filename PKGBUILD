# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Assorted filters designed to operate on 2D planar laser scanners, which use the sensor_msgs/LaserScan type."
url='http://ros.org/wiki/laser_filters'

pkgname='ros-kinetic-laser-filters'
pkgver='1.8.6'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-kinetic-message-filters
  ros-kinetic-tf
  ros-kinetic-pluginlib
  ros-kinetic-roscpp
  ros-kinetic-filters
  ros-kinetic-sensor-msgs
  ros-kinetic-catkin
  ros-kinetic-angles
  ros-kinetic-rostest
  ros-kinetic-laser-geometry)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-message-filters
  ros-kinetic-tf
  ros-kinetic-pluginlib
  ros-kinetic-roscpp
  ros-kinetic-filters
  ros-kinetic-sensor-msgs
  ros-kinetic-angles
  ros-kinetic-laser-geometry)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/laser_filters/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/laser_filters-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="laser_filters-release-release-kinetic-laser_filters"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/laser_filters-release/archive/release/kinetic/laser_filters/${pkgver}-${_pkgver_patch}.tar.gz"
        'laser_filters_boost.patch')
sha256sums=('488974cb235caec153bb9c67b53d712ccff41819978324722b9ef7e064642f4a'
            '8dab7881f500d5e17bcfe36cca7e053bea2905de51e6777ae19917faac0faf6c')

prepare() {
  cd ${srcdir}/${_dir}
  patch -Np1 -i ${srcdir}/laser_filters_boost.patch
}

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

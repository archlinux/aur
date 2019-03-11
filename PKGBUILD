# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Provides nodes to assemble point clouds from either LaserScan or PointCloud messages."
url='http://ros.org/wiki/laser_assembler'

pkgname='ros-kinetic-laser-assembler'
pkgver='1.7.6'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-message-filters
  ros-kinetic-tf
  ros-kinetic-message-generation
  ros-kinetic-pluginlib
  ros-kinetic-roscpp
  ros-kinetic-filters
  ros-kinetic-sensor-msgs
  ros-kinetic-catkin
  ros-kinetic-rostest
  ros-kinetic-laser-geometry)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-message-filters
  ros-kinetic-tf
  ros-kinetic-pluginlib
  ros-kinetic-message-runtime
  ros-kinetic-roscpp
  ros-kinetic-filters
  ros-kinetic-sensor-msgs
  ros-kinetic-laser-geometry)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/laser_assembler/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/laser_assembler-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
#_dir="laser_assembler-release-release-kinetic-laser_assembler-${pkgver}-${_pkgver_patch}"
_dir="laser_assembler-release-release-kinetic-laser_assembler"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/laser_assembler-release/archive/release/kinetic/laser_assembler/${pkgver}-${_pkgver_patch}.tar.gz"
        'boost_posix_time.patch'
        'laser_assembler_boost.patch')
sha256sums=('669a7dfa27df01d2de4227c284ce13aa33f25a38f1a5846c3ea73aaf291fe21e'
            'SKIP'
            'SKIP')
prepare() {
  cd ${srcdir}/${_dir}
  patch -Np1 -i ${srcdir}/boost_posix_time.patch
  patch -Np1 -i ${srcdir}/laser_assembler_boost.patch
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

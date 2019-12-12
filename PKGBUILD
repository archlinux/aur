# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Components of MoveIt connecting to perception."
url='http://moveit.ros.org'

pkgname='ros-kinetic-moveit-ros-perception'
pkgver='1.0.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-message-filters
  ros-kinetic-moveit-core
  ros-kinetic-moveit-msgs
  ros-kinetic-tf
  ros-kinetic-cv-bridge
  ros-kinetic-urdf
  ros-kinetic-pluginlib
  ros-kinetic-roscpp
  ros-kinetic-octomap
  ros-kinetic-sensor-msgs
  ros-kinetic-image-transport
  ros-kinetic-tf-conversions
  ros-kinetic-rosconsole
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  glut
  mesa-libgl
  eigen
  glew)

ros_depends=(ros-kinetic-message-filters
  ros-kinetic-moveit-core
  ros-kinetic-moveit-msgs
  ros-kinetic-tf
  ros-kinetic-cv-bridge
  ros-kinetic-urdf
  ros-kinetic-pluginlib
  ros-kinetic-roscpp
  ros-kinetic-octomap
  ros-kinetic-sensor-msgs
  ros-kinetic-image-transport
  ros-kinetic-tf-conversions
  ros-kinetic-rosconsole)
depends=(${ros_depends[@]}
  glut
  glew
  mesa-libgl)

# Git version (e.g. for debugging)
# _tag=release/kinetic/moveit_ros_perception/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="moveit-release-release-kinetic-moveit_ros_perception"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/kinetic/moveit_ros_perception/${pkgver}-${_pkgver_patch}.tar.gz"
        'moveit_ros_perception_boost.patch'
        'package.xml_version.patch')
sha256sums=('f0c7751a685c9e3d5c6760f3f87ef393d8022a11698ace7209670e8538708e4b'
            '69d478cedc9f31464063ace7ea346f2ac218def046154a0b8bb84fcb1b1a94a8'
            '7160a9d44ffe169f5b9f6750f0d21cd12ab3fe06d38fe77bb7551bd73a059006')

prepare() {
  cd ${srcdir}/${_dir}
  patch -Np1 -i ${srcdir}/moveit_ros_perception_boost.patch
  patch -Np1 -i ${srcdir}/package.xml_version.patch
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

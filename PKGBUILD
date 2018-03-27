# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - gazebo_ros_control."
url='http://ros.org/wiki/gazebo_ros_control'

pkgname='ros-kinetic-gazebo-ros-control'
pkgver='2.5.14'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-kinetic-gazebo-dev
  ros-kinetic-controller-manager
  ros-kinetic-transmission-interface
  ros-kinetic-urdf
  ros-kinetic-pluginlib
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-control-toolbox
  ros-kinetic-catkin
  ros-kinetic-angles
  ros-kinetic-joint-limits-interface
  ros-kinetic-hardware-interface)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-controller-manager
  ros-kinetic-gazebo-ros
  ros-kinetic-transmission-interface
  ros-kinetic-urdf
  ros-kinetic-pluginlib
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-control-toolbox
  ros-kinetic-angles
  ros-kinetic-joint-limits-interface
  ros-kinetic-hardware-interface)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/gazebo_ros_control/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/gazebo_ros_pkgs-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="gazebo_ros_pkgs-release-release-kinetic-gazebo_ros_control-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/gazebo_ros_pkgs-release/archive/release/kinetic/gazebo_ros_control/${pkgver}-${_pkgver_patch}.tar.gz"
  gazebo_9_fixes.patch)
sha256sums=('d1ab5943f207f602c0f0439964007c7536a04a3cc411c06ac5c6f0e59a67cedc'
            'ac4869ae999f4e5871f03b4432a6621f120d754ff1df1820f81ccc491598a83e')

prepare() {
  cd ${srcdir}
  patch -p1 <gazebo_9_fixes.patch
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

# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Kobuki-specific ROS plugins for Gazebo."
url='http://ros.org/wiki/kobuki_gazebo_plugins'

pkgname='ros-indigo-kobuki-gazebo-plugins'
pkgver='0.4.2'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-gazebo-ros
  ros-indigo-std-msgs
  ros-indigo-catkin
  ros-indigo-gazebo-plugins
  ros-indigo-kobuki-msgs
  ros-indigo-sensor-msgs
  ros-indigo-tf
  ros-indigo-nav-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-gazebo-ros
  ros-indigo-std-msgs
  ros-indigo-gazebo-plugins
  ros-indigo-kobuki-msgs
  ros-indigo-sensor-msgs
  ros-indigo-tf
  ros-indigo-nav-msgs)
depends=(${ros_depends[@]}
  boost)

_tag=release/indigo/kobuki_gazebo_plugins/${pkgver}-${_pkgver_patch}
_dir=kobuki_gazebo_plugins
source=("${_dir}"::"git+https://github.com/yujinrobot-release/kobuki_desktop-release.git"#tag=${_tag}
        "gazebo6.patch")
md5sums=('SKIP'
         '85bd435cc6549c68e923c7aa06d16592')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Apply patch
  git -C ${srcdir}/${_dir} apply ${srcdir}/gazebo6.patch

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
	-DCMAKE_CXX_FLAGS=-std=c++11\
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

# Based on a script generated with import_catkin_packages.py
# Modified to use a special branch for Gazebo 7 suport
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - hector_gazebo_plugins provides gazebo plugins from Team Hector."
url='http://ros.org/wiki/hector_gazebo_plugins'

pkgname='ros-indigo-hector-gazebo-plugins'
pkgver='0.3.7'
_pkgver_patch=0
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-indigo-dynamic-reconfigure
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-std-msgs
  ros-indigo-std-srvs
  ros-indigo-catkin
  ros-indigo-tf
  ros-indigo-nav-msgs)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  gazebo)

ros_depends=(ros-indigo-dynamic-reconfigure
  ros-indigo-roscpp
  ros-indigo-geometry-msgs
  ros-indigo-gazebo-ros
  ros-indigo-std-msgs
  ros-indigo-std-srvs
  ros-indigo-tf
  ros-indigo-nav-msgs)
depends=(${ros_depends[@]})

_dir=hector_gazebo_plugins
source=("${_dir}"::"git+https://github.com/tu-darmstadt-ros-pkg/hector_gazebo.git"#branch=argos_gazebo7)
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/${_dir}/build ] || mkdir ${srcdir}/${_dir}/build
  cd ${srcdir}/${_dir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_CXX_FLAGS=-std=c++11\
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/${_dir}/build"
  make DESTDIR="${pkgdir}/" install
}

# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Package which implements capabilities, including code to parse capability interface specs, to parse capability provider specs, and implement the capability server."
url='http://wiki.ros.org/capabilities'

pkgname='ros-kinetic-capabilities'
pkgver='0.2.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-roslaunch
  ros-kinetic-std-msgs
  ros-kinetic-message-generation
  ros-kinetic-rospy
  ros-kinetic-std-srvs
  ros-kinetic-rostest
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-roslaunch
  ros-kinetic-std-msgs
  ros-kinetic-nodelet
  ros-kinetic-message-runtime
  ros-kinetic-rospy
  ros-kinetic-std-srvs
  ros-kinetic-bondpy)
depends=(${ros_depends[@]}
  python2-yaml)

# Git version (e.g. for debugging)
# _tag=release/kinetic/capabilities/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/capabilities-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="capabilities-release-release-kinetic-capabilities-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/capabilities-release/archive/release/kinetic/capabilities/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('0e077da92875d7bec29456cecf7efcd16f42e14bfb8e28ced30e86c6d9d5ff9c')

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

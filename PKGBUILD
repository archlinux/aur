# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Robot-independent Gazebo plugins for sensors, motors and dynamic reconfigurable components."
url='http://gazebosim.org/tutorials?cat=connect_ros'

pkgname='ros-kinetic-gazebo-plugins'
pkgver='2.5.18'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD, Apache 2.0')

ros_makedepends=(ros-kinetic-trajectory-msgs
  ros-kinetic-gazebo-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-angles
  ros-kinetic-rosconsole
  ros-kinetic-catkin
  ros-kinetic-cv-bridge
  ros-kinetic-message-generation
  ros-kinetic-geometry-msgs
  ros-kinetic-camera-info-manager
  ros-kinetic-diagnostic-updater
  ros-kinetic-std-msgs
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-rostest
  ros-kinetic-rosgraph-msgs
  ros-kinetic-image-transport
  ros-kinetic-nav-msgs
  ros-kinetic-tf
  ros-kinetic-urdf
  ros-kinetic-rospy
  ros-kinetic-std-srvs
  ros-kinetic-tf2-ros
  ros-kinetic-gazebo-dev
  ros-kinetic-polled-camera
  ros-kinetic-roscpp
  ros-kinetic-nodelet)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-trajectory-msgs
  ros-kinetic-gazebo-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-angles
  ros-kinetic-rosconsole
  ros-kinetic-cv-bridge
  ros-kinetic-nodelet
  ros-kinetic-geometry-msgs
  ros-kinetic-camera-info-manager
  ros-kinetic-diagnostic-updater
  ros-kinetic-std-msgs
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-rosgraph-msgs
  ros-kinetic-image-transport
  ros-kinetic-nav-msgs
  ros-kinetic-tf
  ros-kinetic-urdf
  ros-kinetic-rospy
  ros-kinetic-std-srvs
  ros-kinetic-tf2-ros
  ros-kinetic-gazebo-dev
  ros-kinetic-polled-camera
  ros-kinetic-message-runtime
  ros-kinetic-roscpp)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/gazebo_plugins/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/gazebo_ros_pkgs-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="gazebo_ros_pkgs-release-release-kinetic-gazebo_plugins-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/gazebo_ros_pkgs-release/archive/release/kinetic/gazebo_plugins/${pkgver}-${_pkgver_patch}.tar.gz"
        opencv-header.patch)
sha256sums=('e5552128bf39a1db90a01d7163507a5557e58d8cf4e9fe70dc5f503aabe557d3'
            '5c6f119ad0bbfd5f4f747a292bbbe2eb7b858f49c31c41ef0bb5f7b27cb7906e')

prepare() {
  cd "${srcdir}/${_dir}"
  patch -p2 -i "${srcdir}/opencv-header.patch"
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

  export PKG_CONFIG_PATH="/opt/OGRE-1.9/lib/pkgconfig"

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

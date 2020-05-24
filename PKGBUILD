# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>
pkgdesc="ROS - Converts a 3D Point Cloud into a 2D laser scan."
url='https://wiki.ros.org/perception_pcl'

pkgname='ros-noetic-pointcloud-to-laserscan'
pkgver='1.4.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-noetic-tf2-sensor-msgs
  ros-noetic-sensor-msgs
  ros-noetic-nodelet
  ros-noetic-roscpp
  ros-noetic-catkin
  ros-noetic-tf2-ros
  ros-noetic-tf2
  ros-noetic-message-filters)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-tf2-sensor-msgs
  ros-noetic-sensor-msgs
  ros-noetic-nodelet
  ros-noetic-roscpp
  ros-noetic-tf2-ros
  ros-noetic-tf2
  ros-noetic-message-filters
  ros-noetic-laser-geometry)
depends=(${ros_depends[@]})

_dir="pointcloud_to_laserscan-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/pointcloud_to_laserscan/archive/${pkgver}.tar.gz")
sha256sums=('ed50811e88be0e60a287eef1973077f74ce16230a73a5f04064c56715f02efc7')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

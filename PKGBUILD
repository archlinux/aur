# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>
pkgdesc="ROS - Converts a 3D Point Cloud into a 2D laser scan."
url='https://wiki.ros.org/perception_pcl'

pkgname='ros-melodic-pointcloud-to-laserscan'
pkgver='1.4.1'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-tf2-sensor-msgs
  ros-melodic-sensor-msgs
  ros-melodic-nodelet
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-tf2-ros
  ros-melodic-tf2
  ros-melodic-message-filters)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-tf2-sensor-msgs
  ros-melodic-sensor-msgs
  ros-melodic-nodelet
  ros-melodic-roscpp
  ros-melodic-tf2-ros
  ros-melodic-tf2
  ros-melodic-message-filters
  ros-melodic-laser-geometry)
depends=(${ros_depends[@]})

_dir="pointcloud_to_laserscan-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/pointcloud_to_laserscan/archive/${pkgver}.tar.gz")
sha256sums=('ed50811e88be0e60a287eef1973077f74ce16230a73a5f04064c56715f02efc7')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

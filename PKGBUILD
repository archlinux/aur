# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Converts a 3D Point Cloud into a 2D laser scan."
url='https://wiki.ros.org/perception_pcl'

pkgname='ros-melodic-pointcloud-to-laserscan'
pkgver='1.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
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
  ros-melodic-message-filters)
depends=(${ros_depends[@]})

_dir="pointcloud_to_laserscan-release-release-melodic-pointcloud_to_laserscan-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/pointcloud_to_laserscan-release/archive/release/melodic/pointcloud_to_laserscan/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('58e4c4ce3d73beaebecfda86a761f17d4680cad274ab57d361ab9bdfe726b29c')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=-python3.7m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

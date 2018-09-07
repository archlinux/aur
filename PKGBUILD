# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - wrapper for libviso2"
url='http://www.ros.org/wiki/viso2'

pkgname='ros-melodic-viso2-ros'
pkgver='0.0.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPL')

ros_makedepends=(ros-melodic-libviso2
  ros-melodic-roscpp
  ros-melodic-rostime
  ros-melodic-rosconsole
  ros-melodic-cv-bridge
  ros-melodic-image-geometry
  ros-melodic-tf
  ros-melodic-image-transport
  ros-melodic-message-filters)
makedepends=('cmake' 'ros-build-tools' 'boost-libs' 'opencv'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-libviso2
  ros-melodic-roscpp
  ros-melodic-rostime
  ros-melodic-rosconsole
  ros-melodic-cv-bridge
  ros-melodic-image-geometry
  ros-melodic-tf
  ros-melodic-image-transport
  ros-melodic-message-filters)
depends=('cmake' 'ros-build-tools' 'boost-libs' 'opencv'
  ${ros_depends[@]})

_dir="viso2/viso2_ros"
source=("viso2"::"git+https://github.com/srv/viso2.git")
sha256sums=('SKIP')

prepare() {
  # Fix wrong header include directory
  sed -i "/#include <viso_/s/viso_/libviso2\/&/" ${srcdir}/${_dir}/src/{mono_odometer.cpp,odometry_params.h,stereo_odometer.cpp}
  # Add installation for binaries
  echo 'install(TARGETS mono_odometer stereo_odometer DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})' >> ${srcdir}/${_dir}/CMakeLists.txt
}

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7.so \
        -DPYTHON_BASENAME=-python3.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

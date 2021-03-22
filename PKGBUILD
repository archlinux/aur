# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - The lms1xx package contains a basic ROS driver for the SICK LMS1xx line of LIDARs."
url='http://ros.org/wiki/LMS1xx'

pkgname='ros-melodic-lms1xx'
pkgver='0.2.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('LGPL')

ros_makedepends=(
  ros-melodic-roscpp
  ros-melodic-roscpp-serialization
  ros-melodic-rosconsole-bridge
  ros-melodic-sensor-msgs
  ros-melodic-catkin
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-roscpp-serialization
  ros-melodic-rosconsole-bridge
  ros-melodic-sensor-msgs
  ros-melodic-roscpp
)

depends=(
  ${ros_depends[@]}
)

# Tarball version (faster download)
_dir="LMS1xx-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/clearpathrobotics/lms1xx/archive/${pkgver}.tar.gz")
sha256sums=('502318ae6f5fb496f2e6e03e2570dc3ae2b29a926098d6ee2ff37794b6397a13')


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
          -DCATKIN_ENABLE_TESTING=OFF \
          -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
          -DPYTHON_EXECUTABLE=/usr/bin/python3 \
          -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
          -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
          -DPYTHON_BASENAME=.cpython-38 \
          -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

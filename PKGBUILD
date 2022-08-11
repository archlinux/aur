pkgdesc="ROS - The lms1xx package contains a basic ROS driver for the SICK LMS1xx line of LIDARs."
url='http://ros.org/wiki/LMS1xx'

pkgname='ros-noetic-lms1xx'
pkgver='0.3.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('LGPL')

ros_makedepends=(
  ros-noetic-roscpp
  ros-noetic-roscpp-serialization
  ros-noetic-rosconsole-bridge
  ros-noetic-sensor-msgs
  ros-noetic-catkin
)

makedepends=(
  cmake
  ros-build-tools
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-roscpp-serialization
  ros-noetic-rosconsole-bridge
  ros-noetic-sensor-msgs
  ros-noetic-roscpp
)

depends=(
  ${ros_depends[@]}
)

_dir="LMS1xx-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/clearpathrobotics/lms1xx/archive/${pkgver}.tar.gz")
sha256sums=('9504e0929c1cea0956c18f9f11045cd2fee449b03e87a0eba4cee72f75eabbb4')

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

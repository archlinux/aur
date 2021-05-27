pkgdesc="ROS - Extra nodes and plugins for MAVROS."
url='https://wiki.ros.org/mavros_extras'

pkgname='ros-noetic-mavros-extras'
pkgver='1.8.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('GPLv3, LGPLv3, BSD')

ros_makedepends=(ros-noetic-std-msgs
  ros-noetic-tf
  ros-noetic-mavros
  ros-noetic-mavros-msgs
  ros-noetic-roscpp
  ros-noetic-catkin
  ros-noetic-urdf
  ros-noetic-geometry-msgs
  ros-noetic-visualization-msgs
  ros-noetic-sensor-msgs
  ros-noetic-cmake-modules)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-tf
  ros-noetic-std-msgs
  ros-noetic-mavros-msgs
  ros-noetic-roscpp
  ros-noetic-urdf
  ros-noetic-geometry-msgs
  ros-noetic-mavros
  ros-noetic-visualization-msgs
  ros-noetic-sensor-msgs)
depends=(${ros_depends[@]}
	 geographiclib)

_dir="mavros-release-upstream-${pkgver}/mavros_extras"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mavlink/mavros-release/archive/refs/tags/upstream/${pkgver}.tar.gz")
sha256sums=('936569a2f3dc4a829187f957ba93c80a65925a4445e3407443d30f717bd93571')

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

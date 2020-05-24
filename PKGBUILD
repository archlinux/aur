pkgdesc="ROS - Extra nodes and plugins for MAVROS."
url='https://wiki.ros.org/mavros_extras'

pkgname='ros-noetic-mavros-extras'
pkgver='0.32.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
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

_dir="mavros-${pkgver}/mavros_extras"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mavlink/mavros/archive/${pkgver}.tar.gz")
sha256sums=('d5e04661f88896a9a77f22a083023ce5e8e13dd71c1f8f1b7d5e187b3bf6c4f8')

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

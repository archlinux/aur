pkgdesc="ROS - Extra nodes and plugins for MAVROS."
url='https://wiki.ros.org/mavros_extras'

pkgname='ros-melodic-mavros-extras'
pkgver='1.5.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('GPLv3, LGPLv3, BSD')

ros_makedepends=(ros-melodic-std-msgs
  ros-melodic-tf
  ros-melodic-mavros
  ros-melodic-mavros-msgs
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-urdf
  ros-melodic-geometry-msgs
  ros-melodic-visualization-msgs
  ros-melodic-sensor-msgs
  ros-melodic-cmake-modules)
makedepends=('cmake' 'ros-build-tools' 'boost1.69'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-tf
  ros-melodic-std-msgs
  ros-melodic-mavros-msgs
  ros-melodic-roscpp
  ros-melodic-urdf
  ros-melodic-geometry-msgs
  ros-melodic-mavros
  ros-melodic-visualization-msgs
  ros-melodic-sensor-msgs)
depends=(${ros_depends[@]}
	 geographiclib
         boost1.69)

_dir="mavros-${pkgver}/mavros_extras"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mavlink/mavros/archive/${pkgver}.tar.gz")
sha256sums=('28e6b007bae627e6db5908575aa249f8fd081f18c67b9925a81914602296d33e')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DBOOST_ROOT=/opt/boost1.69 \
	-DBoost_NO_SYSTEM_PATHS=TRUE
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

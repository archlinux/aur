pkgdesc="ROS - This package provides ROS specific hooks for stage."
url='https://wiki.ros.org/stage_ros'

pkgname='ros-melodic-stage-ros'
pkgver='1.8.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=5
license=('BSD')

ros_makedepends=(ros-melodic-tf
  ros-melodic-std-msgs
  ros-melodic-rostest
  ros-melodic-stage
  ros-melodic-catkin
  ros-melodic-std-srvs
  ros-melodic-roscpp
  ros-melodic-nav-msgs
  ros-melodic-sensor-msgs
  ros-melodic-geometry-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost1.69
  glu)

ros_depends=(ros-melodic-tf
  ros-melodic-std-msgs
  ros-melodic-roscpp
  ros-melodic-stage
  ros-melodic-std-srvs
  ros-melodic-geometry-msgs
  ros-melodic-nav-msgs
  ros-melodic-sensor-msgs)
depends=(${ros_depends[@]}
  boost1.69
  glu)

_dir="stage_ros-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-simulation/stage_ros/archive/${pkgver}.tar.gz")
sha256sums=('21fbe64e3a5f639ce88a69b3ae15eea38a9e2dbeedfb7f9bed21f787706973fb')

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
		 -DBOOST_ROOT=/opt/boost1.69
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

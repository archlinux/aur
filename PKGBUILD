pkgdesc="ROS - Messages for interfacing with various computer vision pipelines, such as object detectors."
url='http://www.ros.org/'

pkgname='ros-noetic-vision-msgs'
epoch=1
pkgver='0.0.1'
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=(ros-noetic-std-msgs
  ros-noetic-message-runtime
  ros-noetic-catkin
  ros-noetic-geometry-msgs
  ros-noetic-message-generation
  ros-noetic-sensor-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-geometry-msgs
  ros-noetic-message-runtime
  ros-noetic-message-generation
  ros-noetic-sensor-msgs
  ros-noetic-std-msgs)
depends=(${ros_depends[@]})

_dir="vision_msgs-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Kukanani/vision_msgs/archive/${pkgver}.tar.gz")
sha256sums=('c50d20dcf010ab02c6c167e58d0f4fc23230d9a90ec774219f6baf7d50597ad9')

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

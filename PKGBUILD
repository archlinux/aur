pkgdesc="ROS - Messages, services and actions used by MoveIt."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-msgs'
pkgver='0.11.2'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
  ros-noetic-actionlib-msgs
  ros-noetic-trajectory-msgs
  ros-noetic-message-generation
  ros-noetic-octomap-msgs
  ros-noetic-object-recognition-msgs
  ros-noetic-geometry-msgs
  ros-noetic-std-msgs
  ros-noetic-sensor-msgs
  ros-noetic-catkin
  ros-noetic-shape-msgs
)

makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-actionlib-msgs
  ros-noetic-trajectory-msgs
  ros-noetic-octomap-msgs
  ros-noetic-object-recognition-msgs
  ros-noetic-geometry-msgs
  ros-noetic-message-runtime
  ros-noetic-std-msgs
  ros-noetic-sensor-msgs
  ros-noetic-shape-msgs)
depends=(${ros_depends[@]})

_dir="moveit_msgs-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit_msgs/archive/${pkgver}.tar.gz")
sha256sums=('1be03f0e9c76336eae6f5c9862961f3defead35c6487d2aade12576a79651454')

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

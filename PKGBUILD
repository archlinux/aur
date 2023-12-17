pkgdesc="ROS - Python interfaces to MoveIt."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-commander'
pkgver='1.1.13'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-catkin
  ros-noetic-moveit-resources)
makedepends=(cmake ros-build-tools
  ${ros_makedepends[@]}
  python
  python-catkin-pkg)

ros_depends=(ros-noetic-moveit-msgs
  ros-noetic-tf
  ros-noetic-geometry-msgs
  ros-noetic-rospy
  ros-noetic-moveit-ros-planning-interface
  ros-noetic-sensor-msgs
  ros-noetic-shape-msgs)
depends=(${ros_depends[@]}
  python
  python-pyassimp)

_dir="moveit-${pkgver}/moveit_commander"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('91735df0ec1a7bdbcdad9028352a0d78d44fad2076584319120e2e10ecb5882c')

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

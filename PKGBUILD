pkgdesc="ROS - Components of MoveIt that use ROS."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-ros'
pkgver='1.1.13'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-catkin)
makedepends=(cmake ros-build-tools
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-moveit-ros-planning
  ros-noetic-moveit-ros-move-group
  ros-noetic-moveit-ros-warehouse
  ros-noetic-moveit-ros-planning-interface
  ros-noetic-moveit-ros-visualization
  ros-noetic-moveit-ros-robot-interaction
  ros-noetic-moveit-ros-benchmarks
  ros-noetic-moveit-ros-manipulation
  ros-noetic-moveit-ros-perception)
depends=(${ros_depends[@]})

_dir="moveit-${pkgver}/moveit_ros/moveit_ros"
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

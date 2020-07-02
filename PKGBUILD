pkgdesc="ROS - This package provides a recovery behavior for the navigation stack that attempts to clear space by performing a 360 degree rotation of the robot."
url='https://wiki.ros.org/rotate_recovery'

pkgname='ros-noetic-rotate-recovery'
pkgver='1.16.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=5
license=('BSD')

ros_makedepends=(ros-noetic-nav-core
  ros-noetic-roscpp
  ros-noetic-base-local-planner
  ros-noetic-costmap-2d
  ros-noetic-catkin
  ros-noetic-cmake-modules
  ros-noetic-tf
  ros-noetic-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen)

ros_depends=(ros-noetic-nav-core
  ros-noetic-tf
  ros-noetic-pluginlib
  ros-noetic-roscpp
  ros-noetic-costmap-2d
  ros-noetic-tf2-geometry-msgs)
depends=(${ros_depends[@]}
  eigen)

_dir="navigation-${pkgver}/rotate_recovery"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/navigation/archive/${pkgver}.tar.gz")
sha256sums=('d83201296e773e2789635fddf39ac18e9465219b18707e53bd2361de4762d205')

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

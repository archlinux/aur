# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Controller for a four wheel steering mobile base"
url='https://wiki.ros.org/four_wheel_steering_controller'

pkgname='ros-noetic-four-wheel-steering-controller'
pkgver='0.21.2'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-catkin
  ros-noetic-controller-interface
  ros-noetic-nav-msgs
  ros-noetic-four-wheel-steering-msgs
  ros-noetic-realtime-tools
  ros-noetic-tf
  ros-noetic-urdf-geometry-parser)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-controller-interface
  ros-noetic-nav-msgs
  ros-noetic-four-wheel-steering-msgs
  ros-noetic-realtime-tools
  ros-noetic-tf
  ros-noetic-urdf-geometry-parser)
depends=(${ros_depends[@]})

_dir="ros_controllers-${pkgver}/four_wheel_steering_controller"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/ros_controllers/archive/${pkgver}.tar.gz")
sha256sums=('19e710b944e972ffb7fadb2d149f97bcdc1c2c0cf38a20405c09afced1543ba4')

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

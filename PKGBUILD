# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Controller for a four wheel steering mobile base"
url='https://wiki.ros.org/four_wheel_steering_controller'

pkgname='ros-melodic-four-wheel-steering-controller'
pkgver='0.17.0'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin
  ros-melodic-controller-interface
  ros-melodic-controller-manager
  ros-melodic-nav-msgs
  ros-melodic-four-wheel-steering-msgs
  ros-melodic-realtime-tools
  ros-melodic-tf
  ros-melodic-urdf-geometry-parser)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-controller-interface
  ros-melodic-controller-manager
  ros-melodic-nav-msgs
  ros-melodic-four-wheel-steering-msgs
  ros-melodic-realtime-tools
  ros-melodic-tf
  ros-melodic-urdf-geometry-parser)
depends=(${ros_depends[@]})

_dir="ros_controllers-${pkgver}/four_wheel_steering_controller"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/ros_controllers/archive/${pkgver}.tar.gz")
sha256sums=('d1b46651956d19a36eedc628c2761526ec4769390e596bd76688abc45f59ace8')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

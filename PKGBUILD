# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Controller for a four wheel steering mobile base"
url='https://wiki.ros.org/four_wheel_steering_controller'

pkgname='ros-melodic-four-wheel-steering-controller'
pkgver='0.14.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin
  ros-melodic-controller-interface
  ros-melodic-nav-msgs
  ros-melodic-four-wheel-steering-msgs
  ros-melodic-realtime-tools
  ros-melodic-tf
  ros-melodic-urdf-geometry-parser)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-controller-interface
  ros-melodic-nav-msgs
  ros-melodic-four-wheel-steering-msgs
  ros-melodic-realtime-tools
  ros-melodic-tf
  ros-melodic-urdf-geometry-parser)
depends=(${ros_depends[@]})

_dir="ros_controllers-release-release-melodic-four_wheel_steering_controller-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_controllers-release/archive/release/melodic/four_wheel_steering_controller/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('5e2aa6a73ff2961c34d1418344578814cb351640371b578caba3ecd873fb8db5')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7.so \
        -DPYTHON_BASENAME=-python3.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - Library of ros controllers."
url='http://ros.org/wiki/ros_controllers'

pkgname='ros-melodic-ros-controllers'
pkgver='0.17.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-ackermann-steering-controller
  ros-melodic-diff-drive-controller
  ros-melodic-forward-command-controller
  ros-melodic-imu-sensor-controller
  ros-melodic-position-controllers
  ros-melodic-force-torque-sensor-controller
  ros-melodic-gripper-action-controller
  ros-melodic-joint-state-controller
  ros-melodic-joint-trajectory-controller
  ros-melodic-effort-controllers
  ros-melodic-velocity-controllers
)

depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/effort_controllers/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_controllers-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_controllers-release-release-melodic-ros_controllers"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_controllers-release/archive/release/melodic/ros_controllers/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('74f7ebff8a7b59a25de522336157c837e194ef84288c5823c2d9e1ba5ef47812')

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


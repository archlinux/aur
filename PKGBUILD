# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - A generic, simple controller manager plugin for MoveIt."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-simple-controller-manager'
pkgver='0.10.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-moveit-core
  ros-melodic-roscpp
  ros-melodic-pluginlib
  ros-melodic-control-msgs
  ros-melodic-actionlib
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-pluginlib
  ros-melodic-control-msgs
  ros-melodic-moveit-core
  ros-melodic-actionlib
  ros-melodic-roscpp)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_simple_controller_manager/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('db9c403189e6cc2ee76b0888ea0e1b3708b5791142e4ef90254469e5e6557e8a')

# Tarball version (faster download)
_dir="moveit-release-release-melodic-moveit_simple_controller_manager-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/melodic/moveit_simple_controller_manager/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('5dc519ed4bed9af6b9d149e80ac82575753e08ce8d408b211351c7875785bc83')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=-python3.7m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

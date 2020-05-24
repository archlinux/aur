# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - A generic, simple controller manager plugin for MoveIt."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-simple-controller-manager'
pkgver='1.0.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-moveit-core
  ros-noetic-roscpp
  ros-noetic-pluginlib
  ros-noetic-control-msgs
  ros-noetic-actionlib
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-pluginlib
  ros-noetic-control-msgs
  ros-noetic-moveit-core
  ros-noetic-actionlib
  ros-noetic-roscpp)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/moveit_simple_controller_manager/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('db9c403189e6cc2ee76b0888ea0e1b3708b5791142e4ef90254469e5e6557e8a')

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_plugins/moveit_simple_controller_manager"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('b8194308c57dbe34bbb729cfccb30d1113af3a54a90a2cfb49482142d1044ea4')

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

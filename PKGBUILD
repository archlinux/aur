# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - A generic, simple controller manager plugin for MoveIt."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-simple-controller-manager'
pkgver='1.0.6'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
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
_dir="moveit-${pkgver}/moveit_plugins/moveit_simple_controller_manager"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('a633830d2ed7e23089f9642d99298cb6eb96148c695c0b4890f2792eac4904b4')

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

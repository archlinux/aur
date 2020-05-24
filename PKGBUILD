# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - A fake controller manager plugin for MoveIt."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-fake-controller-manager'
pkgver='1.0.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-pluginlib
  ros-noetic-moveit-core
  ros-noetic-roscpp
  ros-noetic-moveit-ros-planning
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-pluginlib
  ros-noetic-moveit-core
  ros-noetic-roscpp
  ros-noetic-moveit-ros-planning)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/moveit_fake_controller_manager/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('8db4019f03e81e49fc4bb01add2801828392ad3404a16da4752b36becc52628d')

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_plugins/moveit_fake_controller_manager"
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

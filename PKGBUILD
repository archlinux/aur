# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Planning components of MoveIt that use ROS."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-ros-planning'
pkgver='1.0.2'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-moveit-core
  ros-noetic-pluginlib
  ros-noetic-dynamic-reconfigure
  ros-noetic-moveit-ros-perception
  ros-noetic-actionlib
  ros-noetic-angles
  ros-noetic-chomp-motion-planner
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen)

ros_depends=(ros-noetic-moveit-core
  ros-noetic-pluginlib
  ros-noetic-dynamic-reconfigure
  ros-noetic-moveit-ros-perception
  ros-noetic-actionlib
  ros-noetic-chomp-motion-planner
  ros-noetic-angles)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/moveit_ros_planning/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('de57c3ac56de6cc389205f7557d087cbc7f45e23f32079171384c5a26c6b5e9a')

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_ros/planning"
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

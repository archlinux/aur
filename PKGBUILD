# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Components of MoveIt used for manipulation."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-ros-manipulation'
pkgver='1.0.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-moveit-core
  ros-noetic-moveit-msgs
  ros-noetic-tf
  ros-noetic-moveit-ros-move-group
  ros-noetic-pluginlib
  ros-noetic-roscpp
  ros-noetic-dynamic-reconfigure
  ros-noetic-moveit-ros-planning
  ros-noetic-actionlib
  ros-noetic-rosconsole
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen)

ros_depends=(ros-noetic-moveit-core
  ros-noetic-moveit-msgs
  ros-noetic-tf
  ros-noetic-moveit-ros-move-group
  ros-noetic-pluginlib
  ros-noetic-roscpp
  ros-noetic-dynamic-reconfigure
  ros-noetic-moveit-ros-planning
  ros-noetic-actionlib
  ros-noetic-rosconsole)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/moveit_ros_manipulation/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('7de3f6be5c047901bfe324986686e8d8370be6ebfef96738a8ad3f3365b570f4')

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_ros/manipulation"
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

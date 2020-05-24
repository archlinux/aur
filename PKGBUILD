# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Enhanced tools for benchmarks in MoveIt!."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-ros-benchmarks'
pkgver='1.0.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-pluginlib
  ros-noetic-roscpp
  ros-noetic-moveit-ros-planning
  ros-noetic-moveit-ros-warehouse
  ros-noetic-moveit-core
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-pluginlib
  ros-noetic-roscpp
  ros-noetic-moveit-ros-planning
  ros-noetic-moveit-ros-warehouse
  ros-noetic-moveit-core)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/moveit_ros_benchmarks/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('c84005b45be5707a4e6d5a01c966a9a13ea5c8f754c8c35b5d3fdb2d2ed44c56')

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_ros/benchmarks"
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

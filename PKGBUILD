# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Components of MoveIt that offer interaction via interactive markers."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-ros-robot-interaction'
pkgver='1.0.7'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-tf
  ros-melodic-pluginlib
  ros-melodic-interactive-markers
  ros-melodic-roscpp
  ros-melodic-moveit-ros-planning
  ros-melodic-eigen-conversions
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-tf
  ros-melodic-pluginlib
  ros-melodic-interactive-markers
  ros-melodic-roscpp
  ros-melodic-moveit-ros-planning
  ros-melodic-eigen-conversions)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_ros_robot_interaction/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('a87ad55c71a84901964307736020e522853487171b5a0d60431c6e9ea20045cc')

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_ros/robot_interaction"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('388a15209a0191bcdc8a1a9e6b3eaca4717aaa3a6fb9f541ad31dff7c3d6d07a')

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

# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Planning components of MoveIt that use ROS."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-ros-planning'
pkgver='0.10.8'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-moveit-core
  ros-melodic-pluginlib
  ros-melodic-dynamic-reconfigure
  ros-melodic-moveit-ros-perception
  ros-melodic-actionlib
  ros-melodic-angles
  ros-melodic-chomp-motion-planner
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen)

ros_depends=(ros-melodic-moveit-core
  ros-melodic-pluginlib
  ros-melodic-dynamic-reconfigure
  ros-melodic-moveit-ros-perception
  ros-melodic-actionlib
  ros-melodic-chomp-motion-planner
  ros-melodic-angles)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_ros_planning/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('de57c3ac56de6cc389205f7557d087cbc7f45e23f32079171384c5a26c6b5e9a')

# Tarball version (faster download)
_dir="moveit-release-release-melodic-moveit_ros_planning-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/melodic/moveit_ros_planning/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('beccc923a591ae881a84cc1fb4276b9a6ed9075b3bcfe3d7beb05b81455bdd14')

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

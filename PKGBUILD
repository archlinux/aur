# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Planning components of MoveIt that use ROS."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-ros-planning'
pkgver='1.0.8'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-melodic-actionlib
  ros-melodic-angles
  ros-melodic-catkin
  ros-melodic-chomp-motion-planner
  ros-melodic-dynamic-reconfigure
  ros-melodic-moveit-core
  ros-melodic-moveit-msgs
  ros-melodic-moveit-ros-occupancy-map-monitor
  ros-melodic-pluginlib
  ros-melodic-tf2
  ros-melodic-tf2-eigen
  ros-melodic-tf2-geometry-msgs
  ros-melodic-tf2-msgs
  ros-melodic-tf2-ros
  )
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen)

ros_depends=(
  ros-melodic-actionlib
  ros-melodic-angles
  ros-melodic-chomp-motion-planner
  ros-melodic-dynamic-reconfigure
  ros-melodic-moveit-core
  ros-melodic-moveit-msgs
  ros-melodic-moveit-ros-occupancy-map-monitor
  ros-melodic-pluginlib
  ros-melodic-tf2
  ros-melodic-tf2-eigen
  ros-melodic-tf2-geometry-msgs
  ros-melodic-tf2-msgs
  ros-melodic-tf2-ros
  )
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_ros_planning/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('de57c3ac56de6cc389205f7557d087cbc7f45e23f32079171384c5a26c6b5e9a')

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_ros/planning"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('9f94cac094e0cd73caf2fb75ff85870045239806852aa00f6122f4785da23c14')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69 \
		 -DBoost_NO_SYSTEM_PATHS=TRUE
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

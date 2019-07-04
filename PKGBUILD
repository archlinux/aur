# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Package for all inverse kinematics solvers in MoveIt!."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-kinematics'
pkgver='0.10.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-moveit-core
  ros-melodic-actionlib
  ros-melodic-catkin
  ros-melodic-pluginlib
  ros-melodic-moveit-ros-planning)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen)

ros_depends=(ros-melodic-moveit-core
  ros-melodic-actionlib
  ros-melodic-pluginlib
  ros-melodic-moveit-ros-planning)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_kinematics/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('3b85d8662c2f06fb426997ab7f1d9be228936d1d0a6f29bd0a70ff3891c8d7a9')

# Tarball version (faster download)
_dir="moveit-release-release-melodic-moveit_kinematics-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/melodic/moveit_kinematics/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('eba5cc55232b3a9406992b35ae9865cfcd948b2b0a6da6709a2ced4db89d926f')

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

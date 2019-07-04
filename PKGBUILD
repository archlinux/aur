# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Python interfaces to MoveIt."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-commander'
pkgver='0.10.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python
  python-catkin-pkg)

ros_depends=(ros-melodic-moveit-msgs
  ros-melodic-tf
  ros-melodic-geometry-msgs
  ros-melodic-rospy
  ros-melodic-moveit-ros-planning-interface
  ros-melodic-sensor-msgs
  ros-melodic-shape-msgs)
depends=(${ros_depends[@]}
  python
  python-pyassimp)

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_commander/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('8bf2b1fa88ff397eaa0ef4ffeeef6d28b458322112383985fc6abed2b3b77893')

# Tarball version (faster download)
_dir="moveit-release-release-melodic-moveit_commander-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/melodic/moveit_commander/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('962f2d1ec00b2678d1561ab8a2e5b70df4faf80dc5d3cd4a6b25bb085fffa97d')

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

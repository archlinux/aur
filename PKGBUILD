# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Bound incoming velocity messages according to robot velocity and acceleration limits."
url='https://wiki.ros.org/yocs_velocity_smoother'

pkgname='ros-melodic-yocs-velocity-smoother'
pkgver='0.8.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-roscpp
  ros-melodic-ecl-threads
  ros-melodic-geometry-msgs
  ros-melodic-catkin
  ros-melodic-dynamic-reconfigure
  ros-melodic-nav-msgs
  ros-melodic-pluginlib
  ros-melodic-nodelet)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-roscpp
  ros-melodic-ecl-threads
  ros-melodic-geometry-msgs
  ros-melodic-dynamic-reconfigure
  ros-melodic-nav-msgs
  ros-melodic-pluginlib
  ros-melodic-nodelet)
depends=(${ros_depends[@]})

# Unfortunately, yocs-velocity-smoother is not yet released for melodic. But the kinetic version works fine
_dir="yujin_ocs-release-release-kinetic-yocs_velocity_smoother-${pkgver}-${_pkgver_patch}"
source=("${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/yujinrobot-release/yujin_ocs-release/archive/release/kinetic/yocs_velocity_smoother/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('301ea3851f8e6b544e903177b47025430d8345efde31afbd883754e4c0763b83')

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

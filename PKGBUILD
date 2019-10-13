# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Python interfaces to MoveIt."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-commander'
pkgver='1.0.2'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-catkin
  ros-melodic-moveit-resources)
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

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_commander"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('b8194308c57dbe34bbb729cfccb30d1113af3a54a90a2cfb49482142d1044ea4')

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

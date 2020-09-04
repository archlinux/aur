# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Messages, services and actions used by MoveIt."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-msgs'
pkgver='0.10.1'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-actionlib-msgs
  ros-melodic-trajectory-msgs
  ros-melodic-message-generation
  ros-melodic-octomap-msgs
  ros-melodic-object-recognition-msgs
  ros-melodic-geometry-msgs
  ros-melodic-std-msgs
  ros-melodic-sensor-msgs
  ros-melodic-catkin
  ros-melodic-shape-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-actionlib-msgs
  ros-melodic-trajectory-msgs
  ros-melodic-octomap-msgs
  ros-melodic-object-recognition-msgs
  ros-melodic-geometry-msgs
  ros-melodic-message-runtime
  ros-melodic-std-msgs
  ros-melodic-sensor-msgs
  ros-melodic-shape-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_msgs/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit_msgs-release.git"#tag=${_tag})
# sha256sums=('cf24076ec34f836693b7818e7a36097b50581a66f98518666ebe3f7ba5ef2376')

# Tarball version (faster download)
_dir="moveit_msgs-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit_msgs/archive/${pkgver}.tar.gz")
sha256sums=('81c68bd8c12c38a42abbfb622eb7f64613abcf3ff7dc83f9127eadf428cf4aa5')

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

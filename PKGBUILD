# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Holds the action description and relevant messages for the move_base package."
url='https://wiki.ros.org/move_base_msgs'

pkgname='ros-melodic-move-base-msgs'
pkgver='1.14.1'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-message-generation
  ros-melodic-actionlib-msgs
  ros-melodic-geometry-msgs
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-message-runtime
  ros-melodic-actionlib-msgs
  ros-melodic-geometry-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/move_base_msgs/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation_msgs-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation_msgs-${pkgver}/move_base_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/navigation_msgs/archive/${pkgver}.tar.gz")
sha256sums=('897e2809fa07330f3b01fbd99163dbed5669eec89d4b7fd742d62cf57b690149')

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

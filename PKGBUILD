# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Meta package that contains all essential package of MoveIt!."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit'
pkgver='0.10.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-moveit-core
  ros-melodic-moveit-commander
  ros-melodic-moveit-setup-assistant
  ros-melodic-moveit-planners
  ros-melodic-moveit-plugins
  ros-melodic-moveit-ros)
depends=(${ros_depends[@]})

_dir="moveit-release-release-melodic-moveit-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/melodic/moveit/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('3b8cc20058f0525e54635a8db4983c94777ab88826f4485001a92b13c2d66251')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7.so \
        -DPYTHON_BASENAME=-python3.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

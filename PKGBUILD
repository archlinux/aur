# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A collection of tools for making a variety of generic ROS-related tasks easier."
url='https://wiki.ros.org/wu_ros_tools'

pkgname='ros-melodic-wu-ros-tools'
pkgver='0.2.6'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-easy-markers
  ros-melodic-kalman-filter
  ros-melodic-joy-listener
  ros-melodic-rosbaglive)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/wu_ros_tools/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/wu-robotics/wu_ros_tools.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="wu_ros_tools-${pkgver}/wu_ros_tools"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/DLu/wu_ros_tools/archive/${pkgver}.tar.gz")
sha256sums=('27323d7584aed0782d4b64ca4f1955b237ff3b41736d075d29a9c825a8f55366')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

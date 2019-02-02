# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - tf is a package that lets the user keep track of multiple coordinate frames over time."
url='http://www.ros.org/wiki/tf'

pkgname='ros-kinetic-tf'
pkgver='1.11.9'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-message-filters
  ros-kinetic-message-generation
  ros-kinetic-geometry-msgs
  ros-kinetic-rostime
  ros-kinetic-tf2-ros
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-sensor-msgs
  ros-kinetic-angles
  ros-kinetic-rosconsole
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-message-filters
  ros-kinetic-geometry-msgs
  ros-kinetic-roswtf
  ros-kinetic-message-runtime
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-sensor-msgs
  ros-kinetic-tf2-ros
  ros-kinetic-rosconsole)
depends=(${ros_depends[@]}
  graphviz)

# Git version (e.g. for debugging)
# _tag=release/kinetic/tf/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/geometry-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="geometry-release-release-kinetic-tf-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/geometry-release/archive/release/kinetic/tf/${pkgver}-${_pkgver_patch}.tar.gz"
        "remove-boost-signals.patch::https://github.com/ros/geometry/commit/2eed72cb7b63fc4ee98af695c625d9a741a09897.patch")
sha256sums=('145ad3bd3c5ea0b4b1ff224c39eb03ba5b719f016609f6960589658a9687f53f'
            '5ea32d7dbd0e0c224ca13484c8bead320f246899be166d5971a40a6664876079')

prepare() {
  cd "${srcdir}/${_dir}"
  patch -p2 -i "${srcdir}/remove-boost-signals.patch"
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
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

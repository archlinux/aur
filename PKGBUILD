# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Library for the opencv-based panorama stitching algorithm."
url='http://ros.org/wiki/pano_core'

pkgname='ros-indigo-pano-core'
pkgver='2.3.3'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-indigo-catkin
  ros-indigo-roscpp
  ros-indigo-cv-bridge)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-roscpp
  ros-indigo-cv-bridge)
depends=(
  'opencv2-opt'
  ${ros_depends[@]}
)

_tag=release/indigo/pano_core/${pkgver}-${_pkgver_patch}
_dir=pano_core
source=(
  "${_dir}"::"git+https://github.com/turtlebot-release/turtlebot_apps-release.git#tag=${_tag}"
  'fix-opencv2-path.patch'
)
sha256sums=('SKIP'
            'b165c3d25e56cc6ce86c5cca6dc947496eac6c03597c10f7d36d53df59d88369')

prepare () {
  cd ${srcdir}/${_dir}
  patch -Np1 -i ${srcdir}/fix-opencv2-path.patch
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
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

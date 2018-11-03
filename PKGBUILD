# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This is a python wraper around the pano_core library (I think)."
url='http://ros.org/wiki/pano_py'

pkgname='ros-indigo-pano-py'
pkgver='2.3.3'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-indigo-roscpp
  ros-indigo-cv-bridge
  ros-indigo-std-msgs
  ros-indigo-pano-core
  ros-indigo-rospy
  ros-indigo-catkin
  ros-indigo-image-transport)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-roscpp
  ros-indigo-cv-bridge
  ros-indigo-std-msgs
  ros-indigo-pano-core
  ros-indigo-rospy
  ros-indigo-image-transport)
depends=(
  'opencv2-opt'
  'python2-numpy'
  ${ros_depends[@]}
)

_tag=release/indigo/pano_py/${pkgver}-${_pkgver_patch}
_dir=pano_py
source=(
  "${_dir}"::"git+https://github.com/turtlebot-release/turtlebot_apps-release.git#tag=${_tag}"
  'fix-opencv2-and-numpy-path.patch'
)
sha256sums=('SKIP'
            'c787e445acbf53d2b546279d3cef2b77b978ff3082dad9f03cea4ea24bd60696')

prepare () {
  cd ${srcdir}/${_dir}
  patch -Np1 -i ${srcdir}/fix-opencv2-and-numpy-path.patch
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

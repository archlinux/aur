# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Base dependencies and support libraries for ROS."
url='http://ros.org/wiki/roslib'

pkgname='ros-indigo-roslib'
pkgver='1.11.1'
_pkgver_patch=1
arch=('any')
pkgrel=4
license=('BSD')

ros_makedepends=(ros-indigo-rospack
  ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-indigo-rospack
  ros-indigo-catkin)
depends=(${ros_depends[@]}
  python2-rospkg)

_tag=release/indigo/roslib/${pkgver}-${_pkgver_patch}
_dir=roslib
source=("${_dir}"::"git+https://github.com/ros-gbp/ros-release.git"#tag=${_tag}
        "python.patch")
md5sums=('SKIP'
         'a77b0082d8951c13c6693fd87186590a')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Apply patch
  msg "Patching source code"
  cd ${srcdir}/${_dir}
  git apply ${srcdir}/python.patch

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

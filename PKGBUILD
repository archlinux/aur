# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A metapackage to aggregate the packages required to use publish / subscribe, services, launch files, and other core ROS concepts."
url='http://www.ros.org/'

pkgname='ros-jade-ros-core'
pkgver='1.2.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-std-srvs
  ros-jade-rosgraph-msgs
  ros-jade-cmake-modules
  ros-jade-geneus
  ros-jade-std-msgs
  ros-jade-genpy
  ros-jade-genmsg
  ros-jade-message-generation
  ros-jade-catkin
  ros-jade-gencpp
  ros-jade-roscpp-core
  ros-jade-rosconsole-bridge
  ros-jade-common-msgs
  ros-jade-rospack
  ros-jade-ros
  ros-jade-genlisp
  ros-jade-ros-comm
  ros-jade-message-runtime
  ros-jade-rosbag-migration-rule)
depends=(${ros_depends[@]})

# roslisp cannot be installed on ARM
if test "$CARCH" == x86_64 || test "$CARCH" == i686 ; then
  ros_depends+=('ros-jade-roslisp')
fi

_tag=release/jade/ros_core/${pkgver}-${_pkgver_patch}
_dir=ros_core
source=("${_dir}"::"git+https://github.com/ros-gbp/metapackages-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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

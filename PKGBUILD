# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A set of message filters which take in messages and may output those messages at a later time, based on the conditions that filter needs met."
url='http://ros.org/wiki/message_filters'

pkgname='ros-indigo-message-filters'
pkgver='1.11.21'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-rosunit
  ros-indigo-roscpp
  ros-indigo-rostest
  ros-indigo-catkin
  ros-indigo-rosconsole
  ros-indigo-xmlrpcpp)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-indigo-rosconsole
  ros-indigo-roscpp
  ros-indigo-xmlrpcpp)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/message_filters/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-indigo-message_filters-${pkgver}-${_pkgver_patch}"
source=(
  "${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/indigo/message_filters/${pkgver}-${_pkgver_patch}.tar.gz"
  'fix-template-syntax.patch'
)
sha256sums=('28f2047adddc1946a1c2b963f7b1705a829096e9e196420fb22ca5e0cc1a9c31'
            '2a21768b8874bb1ee7073bee5983cb869f08f79f8e11f1be7d14fb3dab095a6e')

prepare () {
  cd ${srcdir}/${_dir}
  patch -Np1 -i ${srcdir}/fix-template-syntax.patch
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

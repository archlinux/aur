# Maintainer: jerry73204 <jerry73204 at gmail dot com>
# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - cpp_common contains C++ code for doing things that are not necessarily ROS related, but are useful for multiple packages."
url='http://www.ros.org/wiki/cpp_common'

pkgname='ros-indigo-cpp-common'
pkgver='0.5.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  console-bridge)

ros_depends=()
depends=(${ros_depends[@]}
  boost
  console-bridge)

# Git version (e.g. for debugging)
# _tag=release/indigo/cpp_common/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/roscpp_core-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="roscpp_core-release-release-indigo-cpp_common-${pkgver}-${_pkgver_patch}"
source=(
  "${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/roscpp_core-release/archive/release/indigo/cpp_common/${pkgver}-${_pkgver_patch}.tar.gz"
  'console_bridge_dep.patch'
)
sha256sums=('3747d00068ba03da4df78944abf0f55c28007d6a30c805884ec5fb01b16b418b'
            'a627969418dd0577059c984b3cb999a7ed1173394b1f26022be1c347fec84923')

prepare () {
  cd ${srcdir}/${_dir}
  patch -Np1 -i ${srcdir}/console_bridge_dep.patch
  # sed -i 's/logError/CONSOLE_BRIDGE_logError/g' ${srcdir}/${_dir}/src/header.cpp
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

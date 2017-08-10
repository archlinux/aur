# Maintainer: Firas Zaidan <firas@zaidan.de>
pkgdesc="ROS - This package contains a recent version of the Bayesian Filtering Library (BFL), distributed by the Orocos Project."
url='http://ros.org/wiki/bfl'

pkgname='ros-kinetic-bfl'
pkgver='0.7.0'
_pkgver_patch=2
arch=('any')
pkgrel=1
license=('LGPL')

ros_makedepends=()
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  cppunit)

ros_depends=(ros-kinetic-catkin)
depends=(${ros_depends[@]}
  boost
  cppunit)

# Git version (e.g. for debugging)
# _tag=release/kinetic/bfl/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/bfl-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="bfl-release-release-kinetic-bfl-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/bfl-release/archive/release/kinetic/bfl/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('54d9c8ae3cd477fa0a413e2100233e5f450760df4ad7dd8f63723889d913cea6')

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

# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Low-level build system macros and infrastructure for ROS."
url='http://www.ros.org/wiki/catkin'

pkgname='ros-kinetic-catkin'
pkgver='0.7.14'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-catkin_pkg
  python2-empy
  python2)

ros_depends=()
depends=(${ros_depends[@]}
  python2-nose
  gmock
  python2-empy
  gtest
  python2-catkin_pkg
  python2)

# Git version (e.g. for debugging)
# _tag=release/kinetic/catkin/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/catkin-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="catkin-release-release-kinetic-catkin-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/catkin-release/archive/release/kinetic/catkin/${pkgver}-${_pkgver_patch}.tar.gz"
        "cmake-fix.patch"::"https://github.com/ros/catkin/commit/28efc5584d5df89b990b9deb247e794ad55455ca.patch")
sha256sums=('a70d5fcc94d1d61e3cb4a93c5b78af89f4ea0ec42506f025fa332729a22e5194'
            '64a38284f056d48341611bf231f12ba56e155d9f03f551458ff9f07dc0831e3f')

prepare() {
  cd "${srcdir}/${_dir}"
  patch -p1 -i "${srcdir}/cmake-fix.patch"
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
        -DCATKIN_BUILD_BINARY_PACKAGE=OFF \
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

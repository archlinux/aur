# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - ROS Package Tool."
url='http://wiki.ros.org/rospack'

pkgname='ros-kinetic-rospack'
pkgver='2.4.4'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-kinetic-cmake-modules
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2
  gtest
  boost
  tinyxml
  pkg-config)

ros_depends=()
depends=(${ros_depends[@]}
  python2
  python2-rosdep
  python2-catkin-pkg
  tinyxml
  boost
  pkg-config)

# Git version (e.g. for debugging)
# _tag=release/kinetic/rospack/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rospack-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rospack-release-release-kinetic-rospack-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rospack-release/archive/release/kinetic/rospack/${pkgver}-${_pkgver_patch}.tar.gz"
		boost_tr1.patch)
sha256sums=('149f27ece8b24235aaea6ed37ab49d89ec00dad1fa77843ac93fb6836fccf3b4'
            '1e2ca2b01f6e978de06139c9ceadf770b196fd07fd99a2f0e923130920cadc46')

prepare() {
  cd ${srcdir}
  patch -p1 < boost_tr1.patch
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

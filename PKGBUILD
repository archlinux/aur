# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - tf2 is the second generation of the transform library, which lets the user keep track of multiple coordinate frames over time."
url='http://www.ros.org/wiki/tf2'

pkgname='ros-kinetic-tf2'
pkgver='0.5.20'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-tf2-msgs
  ros-kinetic-geometry-msgs
  ros-kinetic-rostime
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  console-bridge)

ros_depends=(ros-kinetic-tf2-msgs
  ros-kinetic-geometry-msgs
  ros-kinetic-rostime)
depends=(${ros_depends[@]}
  console-bridge)

# Git version (e.g. for debugging)
# _tag=release/kinetic/tf2/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/geometry2-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="geometry2-release-release-kinetic-tf2-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/geometry2-release/archive/release/kinetic/tf2/${pkgver}-${_pkgver_patch}.tar.gz"
        "deprecated-log-macros.patch::https://github.com/ros/geometry2/commit/0173a538f89c66e2783dc67ee3609660625e16b4.patch"
        "remove-boost-signals.patch::https://github.com/ros/geometry2/commit/6223549e4d5e1d442a9cfb8e8c7334bcc62c1662.patch")
sha256sums=('a77e9391ece6f3c2d65fcce807dc9f9c79982e226bb8b75555d38b35abf5d140'
            '78c2afef26f613c6461c6bd330147c7b75e9bb1d1fac88a2a43dff1f10e7b1a6'
            '29b1d7bc96363847cd03f504504e4dcca142f05517b126327a2eaac1948a0638')

prepare() {
  cd "${srcdir}/${_dir}"
  patch -p2 -i "${srcdir}/deprecated-log-macros.patch"
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

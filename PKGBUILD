# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - roscpp is a C++ implementation of ROS."
url='http://ros.org/wiki/roscpp'

pkgname='ros-kinetic-roscpp'
pkgver='1.12.14'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-roscpp-traits
  ros-kinetic-message-generation
  ros-kinetic-roslang
  ros-kinetic-roscpp-serialization
  ros-kinetic-rostime
  ros-kinetic-std-msgs
  ros-kinetic-xmlrpcpp
  ros-kinetic-cpp-common
  ros-kinetic-rosgraph-msgs
  ros-kinetic-rosconsole
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  pkg-config)

ros_depends=(ros-kinetic-roscpp-traits
  ros-kinetic-roscpp-serialization
  ros-kinetic-rostime
  ros-kinetic-message-runtime
  ros-kinetic-std-msgs
  ros-kinetic-xmlrpcpp
  ros-kinetic-cpp-common
  ros-kinetic-rosgraph-msgs
  ros-kinetic-rosconsole)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/roscpp/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-kinetic-roscpp-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/kinetic/roscpp/${pkgver}-${_pkgver_patch}.tar.gz"
        "remove-boost-signals.patch")
sha256sums=('4520279b2c32794d79ca4217ab61bc92cb6229d71a04312859b71d95f794e1a0'
            '5336533800118ae1defcd3a7e9e2da4daa6adcbc2c97759a5a3bff1926f527b8')

prepare() {
  cd "${srcdir}/${_dir}"
  patch -p3 -i "${srcdir}/remove-boost-signals.patch"
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

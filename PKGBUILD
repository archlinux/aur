# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - roscpp is a C++ implementation of ROS."
url='http://ros.org/wiki/roscpp'

pkgname='ros-indigo-roscpp'
pkgver='1.12.14'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-roslang
  ros-indigo-roscpp-serialization
  ros-indigo-std-msgs
  ros-indigo-rostime
  ros-indigo-catkin
  ros-indigo-message-generation
  ros-indigo-rosconsole
  ros-indigo-cpp-common
  ros-indigo-roscpp-traits
  ros-indigo-rosgraph-msgs
  ros-indigo-xmlrpcpp)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  pkg-config)

ros_depends=(ros-indigo-roscpp-serialization
  ros-indigo-std-msgs
  ros-indigo-message-runtime
  ros-indigo-rostime
  ros-indigo-rosconsole
  ros-indigo-cpp-common
  ros-indigo-roscpp-traits
  ros-indigo-rosgraph-msgs
  ros-indigo-xmlrpcpp)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/roscpp/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-indigo-roscpp"
source=(
  "${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/indigo/roscpp/${pkgver}-${_pkgver_patch}.tar.gz"
  "0000-readv.patch"
  "0001-boost_time.patch"
)
sha256sums=(
  'd169290a2b5b2c539fd3eaac57aff820fcf2f9546128d98b51ccb69e4fac2570'
  '06c2e8446233a55d8be74ea24f977af923038053cd02ed05118e89644358d845'
  '60fecf40c2465264f887d78ae8817859740db9417b48a00c5ebae5d997b09af6'
)

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Apply patch
  cd "${srcdir}/${_dir}"
  patch -p1 -i "${srcdir}"/0000-readv.patch
  patch -p1 -i "${srcdir}"/0001-boost_time.patch

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd "${srcdir}/build"

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

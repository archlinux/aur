# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Library for capturing data from the Intel(R) RealSense(TM) F200, SR300, R200, LR200 and ZR300 cameras."
url='http://www.ros.org/wiki/RealSense'

pkgname='ros-kinetic-librealsense'
pkgver='1.12.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License, Version 2.0')

ros_makedepends=(ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  libusbx
  linux-headers
  pkg-config
  openssl
  dkms)

ros_depends=()
depends=(${ros_depends[@]}
  libusbx
  linux-headers
  openssl
  dkms)

# Git version (e.g. for debugging)
# _tag=release/kinetic/librealsense/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/intel-ros/librealsense-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="librealsense-release-release-kinetic-librealsense-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/intel-ros/librealsense-release/archive/release/kinetic/librealsense/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('f8bf5872257008e910cc38d0c896b32547e2f4842a8e4a6afd501e83291aadfe')

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

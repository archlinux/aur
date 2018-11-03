# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Library for capturing data from the Intel(R) RealSense(TM) F200, SR300, R200, LR200 and ZR300 cameras."
url='http://www.ros.org/wiki/RealSense'

pkgname='ros-indigo-librealsense'
pkgver='1.12.1'
_pkgver_patch=1
arch=('any')
pkgrel=1
license=('Apache License, Version 2.0')

ros_makedepends=(ros-indigo-catkin)
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
# _tag=release/indigo/librealsense/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/intel-ros/librealsense-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="librealsense-release-release-indigo-librealsense-${pkgver}-${_pkgver_patch}"
source=(
  "${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/intel-ros/librealsense-release/archive/release/indigo/librealsense/${pkgver}-${_pkgver_patch}.tar.gz"
  'missing-headers.patch'
)
sha256sums=('589c58d96e07262d9f032bf3710106c0a384a56daf1db478c359f9652a38eabc'
            'c477b3c6eb99eb973d1a2f49dc00ba1bd0a1756a208e12030610c6e0fefea941')

prepare () {
  cd ${srcdir}/${_dir}
  patch -Np1 -i ${srcdir}/missing-headers.patch
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

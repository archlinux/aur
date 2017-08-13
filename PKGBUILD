# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This contains CvBridge, which converts between ROS Image messages and OpenCV images."
url='http://www.ros.org/wiki/cv_bridge'

pkgname='ros-lunar-cv-bridge'
pkgver='1.12.4'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-lunar-sensor-msgs
  ros-lunar-catkin
  ros-lunar-rosconsole
  opencv)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  python2)

ros_depends=(ros-lunar-sensor-msgs
  ros-lunar-rosconsole
  opencv)
depends=(${ros_depends[@]}
  boost
  python2)

# Git version (e.g. for debugging)
# _tag=release/lunar/cv_bridge/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/vision_opencv-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="vision_opencv-release-release-lunar-cv_bridge-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/vision_opencv-release/archive/release/lunar/cv_bridge/${pkgver}-${_pkgver_patch}.tar.gz" "hdf5.patch")
sha256sums=('e4640ef69d7bb912649ed7986fca3aabb093ead1d3736a7a4a58d0340ec696ea'
            '0c67b512e0531f189978a81ef3927a5bc6764a1d6f42e53ab67c73cd91bb85f3')

prepare() {
  cd ${srcdir}
  patch -p1 < hdf5.patch
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
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

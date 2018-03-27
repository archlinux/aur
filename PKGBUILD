# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - opencv_apps provides various nodes that run internally OpenCVs functionalities and publish the result as ROS topics."
url='http://www.ros.org/'

pkgname='ros-kinetic-opencv-apps'
pkgver='1.12.0'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-kinetic-std-srvs
  ros-kinetic-cv-bridge
  ros-kinetic-message-generation
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-nodelet
  ros-kinetic-image-transport
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-cv-bridge
  ros-kinetic-nodelet
  ros-kinetic-message-runtime
  ros-kinetic-std-msgs
  ros-kinetic-roscpp
  ros-kinetic-dynamic-reconfigure
  ros-kinetic-std-srvs
  ros-kinetic-image-transport)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/opencv_apps/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-perception/opencv_apps-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="opencv_apps-release-release-kinetic-opencv_apps-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-perception/opencv_apps-release/archive/release/kinetic/opencv_apps/${pkgver}-${_pkgver_patch}.tar.gz"
  opencv_fixes.patch)
sha256sums=('0d4b6b827ef9d2382b7d9e1e8a3f08f877e4c969924ec32965bcf28b40f8c6d1'
            'f68391128a350c1fa964437e0ff0285709cef87700063edc50f79ebd764a22ba')

prepare() {
  cd ${srcdir}
  patch -p1 <opencv_fixes.patch
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

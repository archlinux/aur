# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The opencv_apps package, most of code is taken from https://github.com/Itseez/opencv/tree/master/samples/cpp."
url='http://www.ros.org/'

pkgname='ros-indigo-opencv-apps'
pkgver='2.0.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-message-generation
  ros-indigo-std-msgs
  ros-indigo-cv-bridge
  ros-indigo-std-srvs
  ros-indigo-catkin
  ros-indigo-image-transport
  ros-indigo-dynamic-reconfigure)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-nodelet
  ros-indigo-roscpp
  ros-indigo-cv-bridge
  ros-indigo-std-msgs
  ros-indigo-message-runtime
  ros-indigo-std-srvs
  ros-indigo-image-transport
  ros-indigo-dynamic-reconfigure)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/opencv_apps/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-perception/opencv_apps-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="opencv_apps-release-release-indigo-opencv_apps"
source=(
  "${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-perception/opencv_apps-release/archive/release/indigo/opencv_apps/${pkgver}-${_pkgver_patch}.tar.gz"
  'fix-ambiguous-call.patch'
  'fix-opencv-3.4-compatibility.patch'
)
sha256sums=('612961c8611df5e2cc5a9583a586928cf69c17979c92fc724c31714f7979e788'
            '6e76ccb1c620cfb9e7509f4b1e93fcd3ba320ee1122658762b250ae51f8de7e6'
            '8f7bb79462901ea9b4c9da610557d4720e281fcba98ed8ee7e6d9d3b47141f80')

prepare () {
  cd ${srcdir}/${_dir}
  patch -Np1 -i ${srcdir}/fix-ambiguous-call.patch
  patch -Np1 -i ${srcdir}/fix-opencv-3.4-compatibility.patch
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

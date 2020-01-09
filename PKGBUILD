# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - rqt_multiplot provides a GUI plugin for visualizing numeric values in multiple 2D plots using the Qwt plotting backend."
url='http://www.ros.org/'

pkgname='ros-melodic-rqt-multiplot'
pkgver='0.0.10'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('GNU Lesser General Public License (LGPL)')

ros_makedepends=(ros-melodic-variant-topic-tools
  ros-melodic-rqt-gui
  ros-melodic-rqt-gui-cpp
  ros-melodic-roscpp
  ros-melodic-rosbag
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qwt
  qt5-base)

ros_depends=(ros-melodic-rqt-gui
  ros-melodic-roscpp
  ros-melodic-rosbag
  ros-melodic-rqt-gui-cpp
  ros-melodic-variant-topic-tools)
depends=(${ros_depends[@]}
  qwt
  qt5-base)

# Git version (e.g. for debugging)
# _tag=release/melodic/rqt_multiplot/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/anybotics/rqt_multiplot_plugin-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rqt_multiplot_plugin-release-release-melodic-rqt_multiplot-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/anybotics/rqt_multiplot_plugin-release/archive/release/melodic/rqt_multiplot/${pkgver}-${_pkgver_patch}.tar.gz"
        "cmake_qwt.patch"
        "FindQwt.cmake")

sha256sums=('92e975517c6726dcd8a9c73c658d524126d48716bd4db032cec61f641ce27ae8'
            'SKIP'
            'SKIP')

prepare() {
  [ -d ${srcdir}/${_dir}/cmake ] || mkdir ${srcdir}/${_dir}/cmake
  cp ${srcdir}/FindQwt.cmake ${srcdir}/${_dir}/cmake/ 
  cd ${srcdir}/${_dir}
  patch -Np1 -i ${srcdir}/cmake_qwt.patch
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
        -DPYTHON_BASENAME=-python3.8 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

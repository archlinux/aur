# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - qt_gui_cpp provides the foundation for C++-bindings for qt_gui and creates bindings for every generator available."
url='http://ros.org/wiki/qt_gui_cpp'

pkgname='ros-indigo-qt-gui-cpp'
pkgver='0.2.32'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-python-qt-binding
  ros-indigo-pluginlib
  ros-indigo-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt4
  tinyxml
  pkg-config)

ros_depends=(ros-indigo-qt-gui
  ros-indigo-pluginlib)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/indigo/qt_gui_cpp/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/qt_gui_core-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="qt_gui_core-release-release-indigo-qt_gui_cpp-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/qt_gui_core-release/archive/release/indigo/qt_gui_cpp/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('24d14352555852956c3581df5fda5c8dbb427577e46e23fc0e6d145955ec8e3b')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  sed -ie 's/<QWidget>/<QtGui>/g' ${srcdir}/${_dir}/include/qt_gui_cpp/plugin_context.h

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

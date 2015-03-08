# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This stack provides Python bindings for Qt."
url='http://ros.org/wiki/python_qt_binding'

pkgname='ros-indigo-python-qt-binding'
pkgver='0.2.14'
_pkgver_patch=0
arch=('any')
pkgrel=4
license=('BSD, LGPL, GPL')

ros_makedepends=(ros-indigo-catkin
  ros-indigo-rosbuild)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-pyqt4
  qt4)

ros_depends=()
depends=(${ros_depends[@]}
  python2-pyqt4)

_tag=release/indigo/python_qt_binding/${pkgver}-${_pkgver_patch}
_dir=python_qt_binding
source=("${_dir}"::"git+https://github.com/ros-gbp/python_qt_binding-release.git"#tag=${_tag}
        "pyqt411.patch")
md5sums=('SKIP'
         '49dd47f7971958fdca1c2ae06ab2f8bb')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Apply patch
  msg "Patching source code"
  cd ${srcdir}/${_dir}
  git apply ${srcdir}/pyqt411.patch

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - octovis is visualization tool for the OctoMap library based on Qt and libQGLViewer."
url='http://octomap.github.io'

pkgname='ros-indigo-octovis'
pkgver='1.6.9'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('GPLv2')

ros_makedepends=(ros-indigo-octomap)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt4
  libqglviewer-qt4)

ros_depends=(ros-indigo-octomap
  ros-indigo-catkin)
depends=(${ros_depends[@]}
  qt4
  libqglviewer-qt4)

_tag=release/indigo/octovis/${pkgver}-${_pkgver_patch}
_dir=octovis
source=("${_dir}"::"git+https://github.com/ros-gbp/octomap-release.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # QGLViewer is currently wrongly installed to /usr/local, which FindQGLViewer.cmake
  # does not handle.
  QGLViewer_INCLUDE_DIR=/usr/include/QGLViewer
  if [[ -d "/usr/local/include/QGLViewer" ]]; then
    QGLViewer_INCLUDE_DIR=/usr/local/include/QGLViewer
  fi

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DQGLViewer_INCLUDE_DIR="${QGLViewer_INCLUDE_DIR}" \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

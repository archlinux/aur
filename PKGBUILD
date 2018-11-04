# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Tutorials showing how to write plugins for RViz."
url='http://ros.org/wiki/rviz_plugin_tutorials'

pkgname='ros-indigo-rviz-plugin-tutorials'
pkgver='0.9.2'
_pkgver_patch=0
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-indigo-rviz
  ros-indigo-catkin)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-rviz)
depends=(
  'ogre-1.9'
  ${ros_depends[@]}
)

_tag=release/indigo/rviz_plugin_tutorials/${pkgver}-${_pkgver_patch}
_dir=rviz_plugin_tutorials
source=(
  "${_dir}"::"git+https://github.com/ros-gbp/visualization_tutorials-release.git#tag=${_tag}"
  'find-ogre.patch'
)
sha256sums=('SKIP'
            '5fabd1b72ebcaa98ed550eddfd9a5fbe48cdadbce182b33b40a9d53f7a473fdb')

prepare() {
  cd ${srcdir}/${_dir}
  patch -Np1 -i ${srcdir}/find-ogre.patch
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
  env PKG_CONFIG_PATH=/opt/OGRE-1.9/lib/pkgconfig \
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

# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Parser for Semantic Robot Description Format (SRDF)."
url='http://ros.org/wiki/srdfdom'

pkgname='ros-kinetic-srdfdom'
pkgver='0.4.2'
_pkgver_patch=1
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-kinetic-urdfdom-py
  ros-kinetic-urdf
  ros-kinetic-cmake-modules
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  console-bridge
  urdfdom-headers
  boost
  tinyxml)

ros_depends=(ros-kinetic-urdfdom-py)
depends=(${ros_depends[@]}
  console-bridge
  urdfdom-headers
  boost
  tinyxml)

# Git version (e.g. for debugging)
# _tag=release/kinetic/srdfdom/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/srdfdom-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="srdfdom-release-release-kinetic-srdfdom-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/srdfdom-release/archive/release/kinetic/srdfdom/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('2f7dfc30af56d54c3ca610f648ab68face2697f3d4e135410b749dae0d5d0d80')

prepare() {
  cd ${srcdir}
  find . \( -iname *.cpp -o -iname *.h \) \
	  -exec sed -r -i "s/[^_]logError/CONSOLE_BRIDGE_logError/" {} \; \
	  -exec sed -r -i "s/[^_]logWarn/CONSOLE_BRIDGE_logWarn/" {} \; \
	  -exec sed -r -i "s/[^_]logDebug/CONSOLE_BRIDGE_logDebug/" {} \;
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

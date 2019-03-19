# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains generic definitions of geometric shapes and bodies."
url='http://ros.org/wiki/geometric_shapes'

pkgname='ros-kinetic-geometric-shapes'
pkgver='0.5.4'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-kinetic-visualization-msgs
  ros-kinetic-resource-retriever
  ros-kinetic-eigen-stl-containers
  ros-kinetic-random-numbers
  ros-kinetic-octomap
  ros-kinetic-catkin
  ros-kinetic-shape-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen3
  qhull
  assimp
  console-bridge
  boost
  pkg-config)

ros_depends=(ros-kinetic-visualization-msgs
  ros-kinetic-resource-retriever
  ros-kinetic-eigen-stl-containers
  ros-kinetic-random-numbers
  ros-kinetic-octomap
  ros-kinetic-shape-msgs)
depends=(${ros_depends[@]}
  assimp
  qhull
  boost
  eigen3
  console-bridge)

# Git version (e.g. for debugging)
# _tag=release/kinetic/geometric_shapes/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/geometric_shapes-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="geometric_shapes-release-release-kinetic-geometric_shapes-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/geometric_shapes-release/archive/release/kinetic/geometric_shapes/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('47688070fddf98a6f8d288c367e80a1e449a641686cafa1ef4e5679fc92c3298')

prepare() {
  cd ${srcdir}
  find . -iname *.cpp \
	  -exec sed -r -i "s/[^_]logError/CONSOLE_BRIDGE_logError/" {} \; \
	  -exec sed -r -i "s/[^_]logWarn/CONSOLE_BRIDGE_logWarn/" {} \;
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

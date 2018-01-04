# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This package contains generic definitions of geometric shapes and bodies."
url='http://ros.org/wiki/geometric_shapes'

pkgname='ros-lunar-geometric-shapes'
pkgver='0.5.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-lunar-catkin)
makedepends=(${ros_makedepends[@]}
  cmake
  ros-build-tools
  pkg-config)

ros_depends=(ros-lunar-random-numbers
  ros-lunar-visualization-msgs
  ros-lunar-resource-retriever
  ros-lunar-eigen-stl-containers
  ros-lunar-octomap
  ros-lunar-shape-msgs)
depends=(${ros_depends[@]}
  assimp
  boost
  eigen3
  console-bridge
  qhull)

# Git version (e.g. for debugging)
# _tag=release/lunar/geometric_shapes/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/geometric_shapes-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="geometric_shapes-release-release-lunar-geometric_shapes-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/geometric_shapes-release/archive/release/lunar/geometric_shapes/${pkgver}-${_pkgver_patch}.tar.gz" "logError_fix.patch")
sha256sums=('d467aed74d2d66208fdb475f61850414cbabfb04d5d96bbb5efa5b85bfe14798' "dec7225d75a470c3ee633ec0f0669ae79c9b68e8014a86b991a17fd125ba753a")

prepare() {
  cd "${srcdir}"
  patch -Np1 -i "logError_fix.patch"
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 "${srcdir}/${_dir}"

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
        -DCMAKE_PREFIX_PATH=/opt/ros/lunar \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCATKIN_ENABLE_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

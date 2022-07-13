# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The OctoMap library implements a 3D occupancy grid mapping approach, providing data structures and mapping algorithms in C++."
url='http://octomap.github.io'

pkgname='ros-noetic-octomap'
pkgver='1.9.8'
arch=('any')
pkgrel=1
license=('BSD')
options=('staticlibs')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-catkin)
depends=(${ros_depends[@]})

_dir="octomap-${pkgver}/octomap"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OctoMap/octomap/archive/v${pkgver}.tar.gz"
        "iterator.patch::https://patch-diff.githubusercontent.com/raw/OctoMap/octomap/pull/373.patch")
sha256sums=('417af6da4e855e9a83b93458aa98b01a2c88f880088baad2b59d323ce162586e'
            'SKIP')

prepare() {
  cd "$srcdir/octomap-${pkgver}"
  patch -Np1 -i "$srcdir/iterator.patch"
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

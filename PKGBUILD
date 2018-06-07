# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
# Maintainer: Fan Jiang <i@fanjiang.me>
# Contributor: Sean Greenslade <aur@seangreenslade.com>
pkgdesc="ROS - OMPL is a free sampling-based motion planning library."
url='http://ompl.kavrakilab.org'

pkgname='ros-melodic-ompl'
pkgver='1.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=0
license=('BSD')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  eigen)

ros_depends=()
depends=(${ros_depends[@]}
  boost
  eigen)

# Git version (e.g. for debugging)
# _tag=release/melodic/ompl/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ompl-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ompl-release-release-melodic-ompl-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ompl-release/archive/release/melodic/ompl/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('8d4847550f4f212004ee0ec5f07e359297c18df270fe8b964983e80323cd2d43')

prepare() {
  cd ${srcdir}
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
		-DCMAKE_INSTALL_LIBDIR=lib \
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

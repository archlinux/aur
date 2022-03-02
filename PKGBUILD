# Maintainer: DanielNak <daniel@tee.cat>

# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks

pkgname='ros-melodic-sophus'
pkgver='1.0.1'
_pkgver_patch=1
pkgdesc="ROS - C++ implementation of Lie Groups using Eigen."
url='http://www.ros.org/'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=()
makedepends=(
  'cmake'
  'ros-build-tools'
  ${ros_makedepends[@]}
  eigen
)

ros_depends=(ros-melodic-catkin)
depends=(${ros_depends[@]}  eigen)

# Git version (e.g. for debugging)
# _tag=release/melodic/sophus/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/sophus-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="sophus-release-release-melodic-sophus-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/yujinrobot-release/sophus-release/archive/release/melodic/sophus/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('9e42bd34716ace8e9d2ac385a63bb85ce3c3eb6df98e1fa76d8b1dc14f6aade2')

prepare() {
  cd ${_dir}
  sed -i s/-Werror// CMakeLists.txt
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
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.9 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.9.so \
        -DPYTHON_BASENAME=-python3.9 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

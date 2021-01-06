# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - MAVLink message marshaling library."
url='https://qgroundcontrol.org/mavlink/'

pkgname='ros-melodic-mavlink'
pkgver='2021.1.4'
arch=('any')
pkgrel=1
license=('LGPLv3')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python-lxml
  python-future
  python-distribute
  python)

ros_depends=(ros-melodic-catkin)
depends=(${ros_depends[@]}
  python)

# Git version (e.g. for debugging)
# _tag=release/melodic/mavlink/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/mavlink/mavlink-gbp-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="mavlink-gbp-release-upstream-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mavlink/mavlink-gbp-release/archive/upstream/${pkgver}.tar.gz")
sha256sums=('b3e8cf88d981afad80aba5f9c8c9b4d8ea5229e187d839040d8c7e1a9e1d8158')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}
  export ROS_PYTHON_VERSION=3

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

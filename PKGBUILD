# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Resources used for MoveIt! testing."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-resources'
pkgver='0.6.4'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-joint-state-publisher
  ros-noetic-robot-state-publisher)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/moveit_resources/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit_resources-release.git"#tag=${_tag})
# sha256sums=('d98d7e113ff2313fdbc0799a2abf4dc39f462bf7dc904b9b9584cbe241883ab6')

# Tarball version (faster download)
_dir="moveit_resources-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit_resources/archive/${pkgver}.tar.gz")
sha256sums=('6d050a7511f930ca2e2080bcfa379134687eaa24010e2a2cb350dd827de099f1')

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

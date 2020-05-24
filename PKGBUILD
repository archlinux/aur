# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - This package provides messages and serializations / conversion for the OctoMap library."
url='https://wiki.ros.org/octomap_msgs'

pkgname='ros-noetic-octomap-msgs'
pkgver='0.3.3'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-message-generation
  ros-noetic-geometry-msgs
  ros-noetic-catkin
  ros-noetic-std-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-message-runtime
  ros-noetic-std-msgs
  ros-noetic-geometry-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/octomap_msgs/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/octomap_msgs-release.git"#tag=${_tag})
# sha256sums=('e4206d3d3faee4ba465426507df19e6aba521e9fd2c47dd64c142d0d060c3055')

# Tarball version (faster download)
_dir="octomap_msgs-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OctoMap/octomap_msgs/archive/${pkgver}.tar.gz")
sha256sums=('ead6be1199e0d5cf44765e3172e156394602817aad21ca59c22d7a4f678639e4')

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

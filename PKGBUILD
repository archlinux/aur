# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Metapacakge that installs all available planners for MoveIt."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-planners'
pkgver='1.0.2'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-moveit-planners-ompl)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/moveit_planners/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('ee6cfcb76a7549aa89ea1d85c91492602b424599acc20538e66903cd3ccca4bd')

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_planners/moveit_planners"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('b8194308c57dbe34bbb729cfccb30d1113af3a54a90a2cfb49482142d1044ea4')

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

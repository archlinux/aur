# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - This package provides a recovery behavior for the navigation stack that attempts to clear space by reverting the costmaps used by the navigation stack to the static map outside of a given area."
url='https://wiki.ros.org/clear_costmap_recovery'

pkgname='ros-noetic-clear-costmap-recovery'
pkgver='1.16.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(ros-noetic-catkin
  ros-noetic-cmake-modules
  ros-noetic-costmap-2d
  ros-noetic-nav-core
  ros-noetic-pluginlib
  ros-noetic-roscpp
  ros-noetic-tf2-ros)
makedepends=('cmake' 'ros-build-tools' 'eigen3'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-costmap-2d
  ros-noetic-nav-core
  ros-noetic-pluginlib
  ros-noetic-roscpp
  ros-noetic-tf)
depends=(${ros_depends[@]} 'eigen3')

# Git version (e.g. for debugging)
# _tag=release/noetic/clear_costmap_recovery/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-${pkgver}/clear_costmap_recovery"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/navigation/archive/${pkgver}.tar.gz")
sha256sums=('d83201296e773e2789635fddf39ac18e9465219b18707e53bd2361de4762d205')

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

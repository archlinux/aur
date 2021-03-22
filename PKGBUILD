# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - This package provides a recovery behavior for the navigation stack that attempts to clear space by reverting the costmaps used by the navigation stack to the static map outside of a given area."
url='https://wiki.ros.org/clear_costmap_recovery'

pkgname='ros-melodic-clear-costmap-recovery'
pkgver='1.16.7'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-catkin
  ros-melodic-cmake-modules
  ros-melodic-costmap-2d
  ros-melodic-nav-core
  ros-melodic-pluginlib
  ros-melodic-roscpp
  ros-melodic-tf2-ros)
makedepends=('cmake' 'ros-build-tools' 'eigen'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-costmap-2d
  ros-melodic-nav-core
  ros-melodic-pluginlib
  ros-melodic-roscpp
  ros-melodic-tf)
depends=(${ros_depends[@]} 'eigen')

# Git version (e.g. for debugging)
# _tag=release/melodic/clear_costmap_recovery/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-${pkgver}/clear_costmap_recovery"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/navigation/archive/${pkgver}.tar.gz")
sha256sums=('3a4ee70949a07d4f5f84deddb2ee8a4314bc143d10fb2054b90683c7f92a2f33')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

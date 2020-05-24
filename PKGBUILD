# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - navfn provides a fast interpolated navigation function that can be used to create plans for a mobile base."
url='https://wiki.ros.org/navfn'

pkgname='ros-noetic-navfn'
pkgver='1.16.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-noetic-nav-core
  ros-noetic-pcl-ros
  ros-noetic-roscpp
  ros-noetic-geometry-msgs
  ros-noetic-costmap-2d
  ros-noetic-rosconsole
  ros-noetic-pcl-conversions
  ros-noetic-visualization-msgs
  ros-noetic-catkin
  ros-noetic-cmake-modules
  ros-noetic-tf
  ros-noetic-nav-msgs
  ros-noetic-pluginlib)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  netpbm)

ros_depends=(ros-noetic-nav-core
  ros-noetic-pcl-ros
  ros-noetic-roscpp
  ros-noetic-geometry-msgs
  ros-noetic-costmap-2d
  ros-noetic-rosconsole
  ros-noetic-pcl-conversions
  ros-noetic-visualization-msgs
  ros-noetic-tf
  ros-noetic-nav-msgs
  ros-noetic-pluginlib)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/navfn/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-${pkgver}/navfn"
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

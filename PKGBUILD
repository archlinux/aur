# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - This package provides an implementation of a 2D costmap."
url='https://github.com/ros-planning/navigation'

pkgname='ros-melodic-costmap-2d'
pkgver='1.16.2'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-message-filters
  ros-melodic-visualization-msgs
  ros-melodic-pcl-conversions
  ros-melodic-cmake-modules
  ros-melodic-nav-msgs
  ros-melodic-message-generation
  ros-melodic-tf
  ros-melodic-tf2-sensor-msgs
  ros-melodic-geometry-msgs
  ros-melodic-roscpp
  ros-melodic-std-msgs
  ros-melodic-pluginlib
  ros-melodic-dynamic-reconfigure
  ros-melodic-map-msgs
  ros-melodic-sensor-msgs
  ros-melodic-voxel-grid
  ros-melodic-catkin
  ros-melodic-pcl-ros
  ros-melodic-laser-geometry)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-message-filters
  ros-melodic-visualization-msgs
  ros-melodic-pcl-conversions
  ros-melodic-nav-msgs
  ros-melodic-tf
  ros-melodic-tf2-sensor-msgs
  ros-melodic-geometry-msgs
  ros-melodic-roscpp
  ros-melodic-message-runtime
  ros-melodic-std-msgs
  ros-melodic-pluginlib
  ros-melodic-dynamic-reconfigure
  ros-melodic-map-msgs
  ros-melodic-sensor-msgs
  ros-melodic-voxel-grid
  ros-melodic-pcl-ros
  ros-melodic-rosconsole
  ros-melodic-laser-geometry)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/costmap_2d/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-melodic-costmap_2d-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/melodic/costmap_2d/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('187901c824e86f552a2412c712120acad3e06efa0a9c8a44bb8c7d6c0832a1a1')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=-python3.7m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - This package provides an implementation of a 2D costmap."
url='https://wiki.ros.org/costmap_2d'

pkgname='ros-melodic-costmap-2d'
pkgver='1.16.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=5
license=('BSD')

ros_makedepends=(
  ros-melodic-catkin
  ros-melodic-cmake-modules
  ros-melodic-message-generation
  ros-melodic-tf2-geometry-msgs
  ros-melodic-tf2-sensor-msgs
)

makedepends=(
  'cmake'
  'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-dynamic-reconfigure
  ros-melodic-geometry-msgs
  ros-melodic-laser-geometry
  ros-melodic-map-msgs
  ros-melodic-message-filters
  ros-melodic-nav-msgs
  ros-melodic-pluginlib
  ros-melodic-roscpp
  ros-melodic-rostest
  ros-melodic-sensor-msgs
  ros-melodic-std-msgs
  ros-melodic-tf2
  ros-melodic-tf2-ros
  ros-melodic-visualization-msgs
  ros-melodic-voxel-grid
  ros-melodic-message-runtime
  ros-melodic-rosconsole
)

depends=(
    ${ros_depends[@]}
)

_dir="navigation-${pkgver}/costmap_2d"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/navigation/archive/${pkgver}.tar.gz")
sha256sums=('d83201296e773e2789635fddf39ac18e9465219b18707e53bd2361de4762d205')

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

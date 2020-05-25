pkgdesc="ROS - Mapping tools to be used with the OctoMap library, implementing a
3D occupancy grid mapping."
url='http://ros.org/wiki/octomap_mapping'

pkgname='ros-noetic-octomap-mapping'
pkgver='0.6.5'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
  ros-noetic-catkin
)
makedepends=(
  'cmake'
  'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-octomap-server
)
depends=(
  ${ros_depends[@]}
)

_dir="octomap_mapping-${pkgver}/octomap_mapping"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OctoMap/octomap_mapping/archive/${pkgver}.tar.gz")
sha256sums=('dda5b56259a80ab115f547df7a117140016587ec1fe45602845976a518b3c881')

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

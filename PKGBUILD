# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - map_server provides the map_server ROS Node, which offers map data as a ROS Service."
url='https://wiki.ros.org/map_server'

pkgname='ros-noetic-map-server'
pkgver='1.16.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-noetic-rostest
  ros-noetic-tf
  ros-noetic-nav-msgs
  ros-noetic-roscpp
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  sdl_image
  yaml-cpp
  bullet
)

ros_depends=(ros-noetic-rostest
  ros-noetic-tf
  ros-noetic-nav-msgs
  ros-noetic-roscpp)
depends=(${ros_depends[@]}
  sdl_image
  yaml-cpp)

# Tarball version (faster download)
_dir="navigation-${pkgver}/map_server"
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

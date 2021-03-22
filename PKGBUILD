# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - map_server provides the map_server ROS Node, which offers map data as a ROS Service."
url='https://wiki.ros.org/map_server'

pkgname='ros-melodic-map-server'
pkgver='1.16.7'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-melodic-rostest
  ros-melodic-tf
  ros-melodic-nav-msgs
  ros-melodic-roscpp
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools' 'boost1.69'
  ${ros_makedepends[@]}
  sdl_image
  yaml-cpp
  bullet
)

ros_depends=(ros-melodic-rostest
  ros-melodic-tf
  ros-melodic-nav-msgs
  ros-melodic-roscpp)
depends=(${ros_depends[@]}
  sdl_image
  yaml-cpp
  boost1.69)

# Tarball version (faster download)
_dir="navigation-${pkgver}/map_server"
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
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69 \
		 -DBoost_NO_SYSTEM_PATHS=TRUE
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

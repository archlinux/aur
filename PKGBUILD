# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - map_server provides the map_server ROS Node, which offers map data as a ROS Service."
url='https://wiki.ros.org/map_server'

pkgname='ros-melodic-map-server'
pkgver='1.16.2'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-rostest
  ros-melodic-tf
  ros-melodic-nav-msgs
  ros-melodic-roscpp
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
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
  yaml-cpp)

# Tarball version (faster download)
_dir="navigation-release-release-melodic-map_server-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/melodic/map_server/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('bfa8523b9c697f97956d24e89857dcccc5b4cc09844b42adb0ce066c6df28972')

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

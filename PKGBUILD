# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - This package provides messages and serializations / conversion for the OctoMap library."
url='https://wiki.ros.org/octomap_msgs'

pkgname='ros-melodic-octomap-msgs'
pkgver='0.3.5'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-message-generation
  ros-melodic-geometry-msgs
  ros-melodic-catkin
  ros-melodic-std-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-message-runtime
  ros-melodic-std-msgs
  ros-melodic-geometry-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/octomap_msgs/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/octomap_msgs-release.git"#tag=${_tag})
# sha256sums=('e4206d3d3faee4ba465426507df19e6aba521e9fd2c47dd64c142d0d060c3055')

# Tarball version (faster download)
_dir="octomap_msgs-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OctoMap/octomap_msgs/archive/${pkgver}.tar.gz")
sha256sums=('cc08622246d02f134608de37b8671c08b62628a78091d2dbd040bd77f4d7e192')

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

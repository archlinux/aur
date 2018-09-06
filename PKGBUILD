# Maintainer: Timon Engelke <aur@timonengelke.de>
url='https://github.com/flexible-collision-library'
pkgname=ros-melodic-fcl
pkgver=0.5.0
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=('cmake')
depends=('boost' 'libccd' 'ros-melodic-octomap')
_dir=fcl-${pkgver}
source=(https://github.com/flexible-collision-library/fcl/archive/${pkgver}.tar.gz)
sha256sums=('8e6c19720e77024c1fbff5a912d81e8f28004208864607447bc90a31f18fb41a')

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
        -DCMAKE_BUILD_TYPE="Release" \
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

# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
# Maintainer: Fan Jiang <i@fanjiang.me>
# Contributor: Sean Greenslade <aur@seangreenslade.com>
pkgdesc="ROS - OMPL is a free sampling-based motion planning library."
url='https://ompl.kavrakilab.org'

pkgname='ros-melodic-ompl'
pkgver='1.4.1'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  eigen)

ros_depends=()
depends=(${ros_depends[@]}
  boost
  eigen)

_dir="ompl-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ompl/ompl/archive/${pkgver}.tar.gz"
	"boost-fix.patch")
sha256sums=('ad3e8e2201772de5e689ba1eee2d845bea1c7f3cdf08de6d282583fbe699856c'
 	    '41a66f47adc11165278f27c2c565e7e0b37d406c45794383ab8fe1ed6a13cadc')

prepare() {
  cd ${srcdir}/${_dir}
  patch -uN demos/PlannerData.cpp ../../boost-fix.patch || return 1
}

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
        -DPYTHON_BASENAME=.cpython-37m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

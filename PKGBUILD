# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - MAVLink communication library."
url='https://wiki.ros.org/libmavconn'

pkgname='ros-noetic-libmavconn'
pkgver=1.14.0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('GPLv3, LGPLv3, BSD')

ros_makedepends=(ros-noetic-mavlink
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost
  console-bridge)

ros_depends=(ros-noetic-mavlink)
depends=(${ros_depends[@]}
  boost
  console-bridge)

_dir="mavros-${pkgver}/libmavconn"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mavlink/mavros/archive/${pkgver}.tar.gz"
        "geographiclib.patch::https://github.com/mavlink/mavros/pull/1775.patch")
sha256sums=('fc067387de1256a7bb2373e3938c242ad79580a16387f7f69be3302a7cb2fe50'
            '6a820e0588c1cfd0f9ebc0230c143fb8f55406ac015238d04584088c37ec1532')

prepare() {
  cd "$srcdir/mavros-${pkgver}"
  patch -Np1 -i "$srcdir/geographiclib.patch"
}

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

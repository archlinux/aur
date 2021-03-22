pkgdesc="ROS - tf2_tools."
url='https://www.wiki.ros.org/tf2_tools'

pkgname='ros-melodic-tf2-tools'
pkgver='0.6.6'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-tf2-msgs
  ros-melodic-tf2
  ros-melodic-catkin
  ros-melodic-tf2-ros)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-tf2-msgs
  ros-melodic-tf2
  ros-melodic-tf2-ros)
depends=(${ros_depends[@]})

_dir="geometry2-${pkgver}/tf2_tools"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/geometry2/archive/${pkgver}.tar.gz")
sha256sums=('4955f3ca30d194b0e0842f59b97a72d0e933908c20c56c8c374c152ab02568d1')

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

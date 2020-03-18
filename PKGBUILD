pkgdesc="ROS - Contains a set of tools that can be used from a hard realtime
thread, without breaking the realtime behavior."
url='https://wiki.ros.org/realtime_tools'

pkgname='ros-melodic-realtime-tools'
pkgver='1.16.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-melodic-catkin
  ros-melodic-roscpp
  ros-melodic-actionlib)
makedepends=(
  cmake
  ros-build-tools
  ${ros_makedepends[@]})

ros_depends=(
  ros-melodic-roscpp
  ros-melodic-rosunit
  ros-melodic-rostest
  ros-melodic-actionlib)
depends=(${ros_depends[@]})

_dir="${srcdir}/realtime_tools-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/realtime_tools/archive/${pkgver}.tar.gz"
        "tests.patch")
sha256sums=('690222fd2908cec0412d20f6e8b5d8a17132d959edb719e01695e89f7c4d8111'
            'd40ccadd950cbd5743295639bed2d0c1b0ab8a5edfac8f9de5cbf11a48ed8300')

prepare() {
    cd "${srcdir}/${_dir}"
    patch -uN CMakeLists.txt ../../tests.patch || return 1
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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

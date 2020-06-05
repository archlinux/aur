pkgdesc="ROS - Provides a cmake config for the default version of Gazebo for the ROS distribution."
url='https://wiki.ros.org/gazebo_ros_pkgs'

pkgname='ros-noetic-gazebo-dev'
pkgver='2.9.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('Apache 2.0')

ros_makedepends=(ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=()
depends=(${ros_depends[@]}
  gazebo)

_dir="gazebo_ros_pkgs-${pkgver}/gazebo_dev"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-simulation/gazebo_ros_pkgs/archive/${pkgver}.tar.gz")
sha256sums=('9fac7aa1e9773aae20cfef1ec062353f91e4546ebd638e1df2e3f8b51f1e0773')

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

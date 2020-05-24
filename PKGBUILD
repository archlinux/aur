# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Message and service data structures for interacting with Gazebo from ROS."
url='https://wiki.ros.org/gazebo_msgs'

pkgname='ros-noetic-gazebo-msgs'
pkgver='2.8.6'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-std-msgs
  ros-noetic-trajectory-msgs
  ros-noetic-catkin
  ros-noetic-std-srvs
  ros-noetic-geometry-msgs
  ros-noetic-message-generation
  ros-noetic-sensor-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-std-msgs
  ros-noetic-trajectory-msgs
  ros-noetic-sensor-msgs
  ros-noetic-std-srvs
  ros-noetic-geometry-msgs
  ros-noetic-message-runtime)
depends=(${ros_depends[@]})

_dir="gazebo_ros_pkgs-${pkgver}/gazebo_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-simulation/gazebo_ros_pkgs/archive/${pkgver}.tar.gz"
        "spawn_model.patch")
sha256sums=('df928fbeebd277b8eedf7eb367ab88631de71ef6c552424731eaf855186bc4b4'
            'a8a83abda169cca6a7709dc618f0b74a270f55ce274ac0108eec5df09f3bb3e8')

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

  # Patch a file after compilation
  cd "${srcdir}/build/devel/lib/python.8/site-packages/gazebo_msgs/srv/"
  patch -uN _SpawnModel.py ${srcdir}/../spawn_model.patch || return 1
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

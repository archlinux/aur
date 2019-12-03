# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Message and service data structures for interacting with Gazebo from ROS."
url='https://gazebosim.org/tutorials?cat=connect_ros'

pkgname='ros-melodic-gazebo-msgs'
pkgver='2.8.5'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-std-msgs
  ros-melodic-trajectory-msgs
  ros-melodic-catkin
  ros-melodic-std-srvs
  ros-melodic-geometry-msgs
  ros-melodic-message-generation
  ros-melodic-sensor-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-std-msgs
  ros-melodic-trajectory-msgs
  ros-melodic-sensor-msgs
  ros-melodic-std-srvs
  ros-melodic-geometry-msgs
  ros-melodic-message-runtime)
depends=(${ros_depends[@]})

_dir="gazebo_ros_pkgs-${pkgver}/gazebo_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-simulation/gazebo_ros_pkgs/archive/${pkgver}.tar.gz"
        "spawn_model.patch")
sha256sums=('0b0f6eeaeca611ebe12ec0ea4388121098fdafee5ecc8d76c6ae69b8b8f14aed'
            'a8a83abda169cca6a7709dc618f0b74a270f55ce274ac0108eec5df09f3bb3e8')

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

  # Patch a file after compilation
  cd "${srcdir}/build/devel/lib/python3.8/site-packages/gazebo_msgs/srv/"
  patch -uN _SpawnModel.py ${srcdir}/../spawn_model.patch || return 1
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

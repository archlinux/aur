# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>
pkgdesc="ROS - amcl is a probabilistic localization system for a robot moving in 2D."
url='https://wiki.ros.org/amcl'

pkgname='ros-melodic-amcl'
pkgver='1.16.2'
arch=('any')
pkgrel=3
license=('LGPL')

ros_makedepends=(ros-melodic-catkin
  ros-melodic-dynamic-reconfigure
  ros-melodic-geometry-msgs
  ros-melodic-message-filters
  ros-melodic-nav-msgs
  ros-melodic-rosbag
  ros-melodic-roscpp
  ros-melodic-std-srvs
  ros-melodic-tf2
  ros-melodic-tf2-geometry-msgs
  ros-melodic-tf2-msgs
  ros-melodic-tf2-ros
  ros-melodic-sensor-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-dynamic-reconfigure
  ros-melodic-geometry-msgs
  ros-melodic-nav-msgs
  ros-melodic-rosbag
  ros-melodic-roscpp
  ros-melodic-std-srvs
  ros-melodic-tf2
  ros-melodic-tf2-msgs
  ros-melodic-tf2-ros)
depends=(${ros_depends[@]})

# Tarball version (faster download)
_dir="navigation-${pkgver}/amcl"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/navigation/archive/${pkgver}.tar.gz")
sha256sums=('d83201296e773e2789635fddf39ac18e9465219b18707e53bd2361de4762d205')

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

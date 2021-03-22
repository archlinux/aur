pkgdesc="ROS - Bound incoming velocity messages according to robot velocity and acceleration limits."
url='https://wiki.ros.org/yocs_velocity_smoother'

pkgname='ros-melodic-yocs-velocity-smoother'
pkgver='0.8.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(ros-melodic-roscpp
  ros-melodic-ecl-threads
  ros-melodic-geometry-msgs
  ros-melodic-catkin
  ros-melodic-dynamic-reconfigure
  ros-melodic-nav-msgs
  ros-melodic-pluginlib
  ros-melodic-nodelet)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-roscpp
  ros-melodic-ecl-threads
  ros-melodic-geometry-msgs
  ros-melodic-dynamic-reconfigure
  ros-melodic-nav-msgs
  ros-melodic-pluginlib
  ros-melodic-nodelet)
depends=(${ros_depends[@]})

_dir="yujin_ocs-${pkgver}/yocs_velocity_smoother"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/yujinrobot/yujin_ocs/archive/${pkgver}.tar.gz")
sha256sums=('cb81a2590558b7513f28ef8f9c9571ba9eeb1cae03d2db4c52b0509a70804001')

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

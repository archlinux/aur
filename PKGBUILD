# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Messages for robots using FourWheelSteering"
url='https://wiki.ros.org/four_wheel_steering_msgs'

pkgname='ros-melodic-four-wheel-steering-msgs'
pkgver='1.1.0'
arch=('any')
pkgrel=4
license=('BSD')

ros_makedepends=(ros-melodic-catkin
  ros-melodic-message-generation
  ros-melodic-message-runtime
  ros-melodic-std-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-std-msgs
  ros-melodic-message-runtime)
depends=(${ros_depends[@]})

_dir="four_wheel_steering_msgs-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/four_wheel_steering_msgs/archive/${pkgver}.tar.gz")
sha256sums=('117441ec5449224ab45080b8c32e496a1f74ac7bea8ce35eae426ee043b60150')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69 \
		 -DBoost_NO_SYSTEM_PATHS=TRUE
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

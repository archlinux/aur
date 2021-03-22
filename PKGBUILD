pkgdesc="ROS - Plays rosbags as though they were happening NOW."
url='https://wiki.ros.org/rosbaglive'

pkgname='ros-melodic-rosbaglive'
pkgver='0.2.6'
arch=('any')
pkgrel=5
license=('BSD')

ros_makedepends=(ros-melodic-rosbag
  ros-melodic-catkin
  ros-melodic-roslint
  ros-melodic-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-rosbag
  ros-melodic-rospy)
depends=(${ros_depends[@]})

_dir="wu_ros_tools-${pkgver}/rosbaglive"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/DLu/wu_ros_tools/archive/${pkgver}.tar.gz")
sha256sums=('27323d7584aed0782d4b64ca4f1955b237ff3b41736d075d29a9c825a8f55366')

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

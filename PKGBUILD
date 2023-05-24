pkgdesc="ROS - Messages for transmitting audio via ROS."
url='https://wiki.ros.org/audio_common_msgs'

pkgname='ros-noetic-audio-common-msgs'
pkgver='0.3.16'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-message-generation
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-message-runtime
)
depends=(
    ${ros_depends[@]}
)

_dir="audio_common-${pkgver}/audio_common_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/audio_common/archive/${pkgver}.tar.gz")
sha256sums=('579b8bfa0834fa931f846a76360eb891f28e352e8405e949763dc40ad38d87a0')

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

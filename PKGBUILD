pkgdesc="ROS - sound_play provides a ROS node that translates commands on a ROS topic (robotsound) into sounds."
url='https://wiki.ros.org/sound_play'

pkgname='ros-noetic-sound-play'
pkgver='0.3.11'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-roscpp
    ros-noetic-roslib
    ros-noetic-actionlib-msgs
    ros-noetic-actionlib
    ros-noetic-audio-common-msgs
    ros-noetic-diagnostic-msgs
    ros-noetic-message-generation
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    python-setuptools
)

ros_depends=(
    ros-noetic-roscpp
    ros-noetic-roslib
    ros-noetic-actionlib-msgs
    ros-noetic-audio-common-msgs
    ros-noetic-diagnostic-msgs
    ros-noetic-rospy
    ros-noetic-message-runtime
)
depends=(
    ${ros_depends[@]}
    python-gobject
    gstreamer
    gst-plugins-base
    gst-plugins-ugly
    gst-plugins-good
    festival
    festival-english
)

_dir="audio_common-${pkgver}/sound_play"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/audio_common/archive/${pkgver}.tar.gz")
sha256sums=('0c72196d0d551bb1b9a1c9c134bbfd1b3073529c93a495c4d829911c38db3b1d')

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

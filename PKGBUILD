pkgdesc="ROS - Outputs audio to a speaker from a source node."
url='https://wiki.ros.org/audio_play'

pkgname='ros-noetic-audio-play'
pkgver='0.3.11'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-roscpp
    ros-noetic-audio-common-msgs
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    gstreamer
    gst-plugins-base
)

ros_depends=(
    ros-noetic-roscpp
    ros-noetic-audio-common-msgs
)
depends=(
    ${ros_depends[@]}
    gstreamer
    gst-plugins-base
    gst-plugins-ugly
    gst-plugins-good
)

_dir="audio_common-${pkgver}/audio_play"
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

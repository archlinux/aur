pkgdesc="ROS - Transports audio from a source to a destination."
url='https://wiki.ros.org/audio_capture'

pkgname='ros-melodic-audio-capture'
pkgver='0.3.10'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-roscpp
  ros-melodic-audio-common-msgs
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  gstreamer
  gst-plugins-base)

ros_depends=(ros-melodic-roscpp
  ros-melodic-audio-common-msgs)
depends=(${ros_depends[@]}
  gst-plugins-good
  gstreamer
  gst-plugins-base
  gst-plugins-ugly)

_dir="audio_common-${pkgver}/audio_capture"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/audio_common/archive/${pkgver}.tar.gz")
sha256sums=('18fc68e3d2fa152bdba6c374845e8dbc366c9fcfe88b90b37c9c8dc9803185e7')

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

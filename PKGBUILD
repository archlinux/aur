# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A ROS Driver for V4L USB Cameras."
url='http://wiki.ros.org/usb_cam'

pkgname='ros-melodic-usb-cam'
pkgver='0.3.6'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-camera-info-manager
  ros-melodic-std-msgs
  ros-melodic-roscpp
  ros-melodic-std-srvs
  ros-melodic-sensor-msgs
  ros-melodic-image-transport
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  ffmpeg)

ros_depends=(ros-melodic-camera-info-manager
  ros-melodic-std-msgs
  ros-melodic-roscpp
  ros-melodic-std-srvs
  ros-melodic-sensor-msgs
  ros-melodic-image-transport)
depends=(${ros_depends[@]}
  v4l-utils
  ffmpeg)

# Git version (e.g. for debugging)
# _tag=release/melodic/usb_cam/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/usb_cam-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="usb_cam-release-release-melodic-usb_cam-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/usb_cam-release/archive/release/melodic/usb_cam/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('21a2fa956af929b771c989bdb53a572443481b101cea0ba0b66547e0440a9bd5')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
        -DPYTHON_BASENAME=-python3.8 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

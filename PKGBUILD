# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Object_recognition_msgs contains the ROS message and the actionlib definition used in object_recognition_core."
url='https://wiki.ros.org/object_recognition_msgs'

pkgname='ros-noetic-object-recognition-msgs'
pkgver='0.4.1'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-geometry-msgs
  ros-noetic-message-generation
  ros-noetic-actionlib-msgs
  ros-noetic-std-msgs
  ros-noetic-sensor-msgs
  ros-noetic-catkin
  ros-noetic-shape-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-geometry-msgs
  ros-noetic-actionlib-msgs
  ros-noetic-message-runtime
  ros-noetic-std-msgs
  ros-noetic-sensor-msgs
  ros-noetic-shape-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/object_recognition_msgs/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/object_recognition_msgs-release.git"#tag=${_tag})
# sha256sums=('b7689a079ad78a4358946fa5a38de0c9a5c12e46381d22106f053ac5cde357f1')

# Tarball version (faster download)
_dir="object_recognition_msgs-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/wg-perception/object_recognition_msgs/archive/${pkgver}.tar.gz")
sha256sums=('b7689a079ad78a4358946fa5a38de0c9a5c12e46381d22106f053ac5cde357f1')

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

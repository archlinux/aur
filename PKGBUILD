pkgdesc="Viewer for Kinect One (Kinect v2) in ROS."
url='https://github.com/code-iai/iai_kinect2'

pkgname='ros-jade-kinect2-viewer'
pkgver='0.0.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('apache')

submodule_name=kinect2_viewer

ros_makedepends=(ros-jade-roscpp
  ros-jade-rostime
  ros-jade-std-msgs
  ros-jade-sensor-msgs
  ros-jade-message-filters
  ros-jade-image-transport
  ros-jade-compressed-image-transport
  ros-jade-compressed-depth-image-transport
  ros-jade-kinect2-bridge)
makedepends=('cmake' 'ros-build-tools' 'pcl'
  ${ros_makedepends[@]})

ros_depends=(
  ros-jade-message-runtime
  ros-jade-roscpp
  ros-jade-roscpp
  ros-jade-rostime
  ros-jade-std-msgs
  ros-jade-sensor-msgs
  ros-jade-message-filters
  ros-jade-image-transport
  ros-jade-compressed-image-transport
  ros-jade-compressed-depth-image-transport
  ros-jade-kinect2-bridge)
depends=('pcl' ${ros_depends[@]})

# Git version (e.g. for debugging)
_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/code-iai/iai_kinect2.git")
sha256sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  cmake ${srcdir}/${_dir}/${submodule_name} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}/" install
}

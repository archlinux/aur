pkgdesc="libfreenect2 binding for ROS."
url='https://github.com/code-iai/iai_kinect2'

pkgname='ros-jade-kinect2-bridge'
pkgver='0.0.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('apache')

submodule_name=kinect2_bridge

ros_makedepends=(ros-jade-roscpp
  ros-jade-rostime
  ros-jade-tf
  ros-jade-std-msgs
  ros-jade-sensor-msgs
  ros-jade-message-filters
  ros-jade-compressed-depth-image-transport
  ros-jade-kinect2-registration
  ros-jade-nodelet)
makedepends=('cmake' 'ros-build-tools' 'libfreenect2'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-roscpp
  ros-jade-rostime
  ros-jade-tf
  ros-jade-std-msgs
  ros-jade-sensor-msgs
  ros-jade-message-filters
  ros-jade-compressed-depth-image-transport
  ros-jade-kinect2-registration
  ros-jade-nodelet
  ros-jade-depth-image-proc)
depends=(${ros_depends[@]} 'libfreenect2')

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

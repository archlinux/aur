pkgdesc="Metapackage for Kinect v2 tools from Institute for Artificial Intelligenceusing in Bremen."
url='https://github.com/code-iai/iai_kinect2'

pkgname='ros-jade-kinect2'
pkgver='0.0.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('apache')

submodule_name=iai_kinect2

makedepends=('cmake' 'ros-build-tools')

ros_depends=(ros-jade-tf2-ros
  ros-jade-kinect2-registration
  ros-jade-kinect2-bridge
  ros-jade-kinect2-viewer
  ros-jade-kinect2-calibration)
depends=(${ros_depends[@]})

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

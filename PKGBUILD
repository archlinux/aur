pkgdesc="Tools for using the Kinect One (Kinect v2) in ROS."
url='https://github.com/code-iai/iai_kinect2'

pkgname='ros-noetic-kinect2-registration'
pkgver='0.0.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('apache')

submodule_name=kinect2_registration

ros_makedepends=(ros-noetic-roscpp)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-roscpp)
depends=(${ros_depends[@]})

_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/code-iai/iai_kinect2.git")
sha256sums=('SKIP')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts

  cmake ${srcdir}/${_dir}/${submodule_name} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}/" install
}

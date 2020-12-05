pkgdesc="libfreenect2 binding for ROS."
url='https://github.com/code-iai/iai_kinect2'

pkgname='ros-noetic-kinect2-bridge'
pkgver='0.0.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('apache')

submodule_name=kinect2_bridge

ros_makedepends=(ros-noetic-roscpp
  ros-noetic-rostime
  ros-noetic-tf
  ros-noetic-std-msgs
  ros-noetic-sensor-msgs
  ros-noetic-message-filters
  ros-noetic-compressed-depth-image-transport
  ros-noetic-kinect2-registration
  ros-noetic-nodelet)
makedepends=('cmake' 'ros-build-tools' 'libfreenect2'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-roscpp
  ros-noetic-rostime
  ros-noetic-tf
  ros-noetic-std-msgs
  ros-noetic-sensor-msgs
  ros-noetic-message-filters
  ros-noetic-compressed-depth-image-transport
  ros-noetic-kinect2-registration
  ros-noetic-nodelet
  ros-noetic-depth-image-proc)
depends=(${ros_depends[@]} 'libfreenect2')

# Git version (e.g. for debugging)
 _dir=${pkgname}
 source=("${_dir}"::"git+https://github.com/code-iai/iai_kinect2.git" "patch.patch")
 sha256sums=('SKIP' '3df544f12e67c4c9ec4dcb5d3ab434bd3e68076950735395c182fd357100931b')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash
  pwd
  cd "ros-noetic-kinect2-bridge/"
  dos2unix kinect2_bridge/src/kinect2_bridge.cpp
  # Fix opencv path
  patch -Np1 -i "${srcdir}/patch.patch"
  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build



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

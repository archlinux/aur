pkgdesc="Calibration tool for Kinect One (Kinect v2) in ROS."
url='https://github.com/code-iai/iai_kinect2'

pkgname='ros-noetic-kinect2-calibration'
pkgver='0.0.1'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('apache')

submodule_name=kinect2_calibration

ros_makedepends=(ros-noetic-roscpp
  ros-noetic-rostime
  ros-noetic-std-msgs
  ros-noetic-sensor-msgs
  ros-noetic-message-filters
  ros-noetic-image-transport
  ros-noetic-compressed-depth-image-transport
  ros-noetic-compressed-image-transport
  ros-noetic-kinect2-bridge)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-message-runtime
  ros-noetic-roscpp
  ros-noetic-rostime
  ros-noetic-std-msgs
  ros-noetic-sensor-msgs
  ros-noetic-message-filters
  ros-noetic-image-transport
  ros-noetic-compressed-depth-image-transport
  ros-noetic-compressed-image-transport
  ros-noetic-kinect2-bridge)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/code-iai/iai_kinect2.git" "fix_cv3_to_4.patch")
sha256sums=('SKIP' 'ab71cef077731213a34059b29f3be3ced46c179b87fac17252f138473d2929ef')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash
  cd ros-noetic-kinect2-calibration
  
  find kinect2_calibration -type f -print0 | xargs -0 dos2unix --
  
  patch -Np1 -i "${srcdir}/fix_cv3_to_4.patch"
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

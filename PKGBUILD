# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="ROS - Cartographer is a system that provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations."
url='https://github.com/googlecartographer/cartographer_ros'

pkgname='ros-noetic-cartographer-ros-git'
pkgver=r584.151c563
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('Apache 2.0')
provides=(${pkgname::-4})

ros_makedepends=(
  ros-noetic-tf2-ros
  ros-noetic-cartographer-ros-msgs
  ros-noetic-roslib
  ros-noetic-eigen-conversions
  ros-noetic-tf2
  ros-noetic-pcl-conversions
  ros-noetic-message-runtime
  ros-noetic-cartographer
  ros-noetic-urdf
  ros-noetic-rosbag
  ros-noetic-sensor-msgs
  ros-noetic-geometry-msgs
  ros-noetic-robot-state-publisher
  ros-noetic-nav-msgs
  ros-noetic-roslaunch
  ros-noetic-visualization-msgs
  ros-noetic-tf2-eigen
  ros-noetic-catkin
  ros-noetic-std-msgs
  ros-noetic-roscpp
)

makedepends=(
  cmake
  ros-build-tools
  google-glog
  protobuf
  gcc
  python-sphinx
  gflags
  gmock
  pcl
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-tf2-ros
  ros-noetic-cartographer-ros-msgs
  ros-noetic-roslib
  ros-noetic-eigen-conversions
  ros-noetic-tf2
  ros-noetic-pcl-conversions
  ros-noetic-message-runtime
  ros-noetic-cartographer
  ros-noetic-urdf
  ros-noetic-rosbag
  ros-noetic-sensor-msgs
  ros-noetic-geometry-msgs
  ros-noetic-robot-state-publisher
  ros-noetic-nav-msgs
  ros-noetic-roslaunch
  ros-noetic-visualization-msgs
  ros-noetic-tf2-eigen
  ros-noetic-std-msgs
  ros-noetic-roscpp
)
depends=(
  google-glog
  gflags
  pcl
  ${ros_depends[@]}
)

source=(
  $pkgname::git://github.com/cartographer-project/cartographer_ros.git
  CMakeLists.patch
)
sha256sums=('SKIP'
'18bafe6a7b7c0a894ce2055ace65925dedab29aab0183f56ba01cb8937013b86')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}/cartographer_ros"
    patch -uN CMakeLists.txt ../../CMakeLists.patch || return 1
}

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build project
    cmake ${srcdir}/${pkgname}/cartographer_ros \
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_ENABLE_TESTING=0 \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DPYTHON_INCLUDE_DIR=/usr/include/python3.9 \
            -DPYTHON_LIBRARY=/usr/lib/libpython3.9.so \
            -DPYTHON_BASENAME=-python3.9 \
            -DSETUPTOOLS_DEB_LAYOUT=OFF \
            -DCMAKE_CXX_STANDARD=17
            make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}

# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-noetic-arch/ros-build-tools-py3
# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="ROS - Cartographer is a system that provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations."
url='https://github.com/googlecartographer/cartographer'

pkgname='ros-noetic-cartographer-rviz'
pkgver='1.0.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('Apache 2.0')

ros_makedepends=(
  ros-noetic-message-runtime
  ros-noetic-cartographer
  ros-noetic-cartographer-ros
  ros-noetic-rviz
  ros-noetic-catkin
  ros-noetic-cartographer-ros-msgs
  ros-noetic-roslib
  ros-noetic-eigen-conversions
  ros-noetic-roscpp
)
makedepends=(
  cmake
  ros-build-tools
  ${ros_makedepends[@]}
  gcc
  qt5-base
)

ros_depends=(
  ros-noetic-message-runtime
  ros-noetic-cartographer
  ros-noetic-cartographer-ros
  ros-noetic-rviz
  ros-noetic-cartographer-ros-msgs
  ros-noetic-roslib
  ros-noetic-eigen-conversions
  ros-noetic-roscpp
)

depends=(
  ${ros_depends[@]}
  qt5-base
)

# Tarball version (faster download)
_dir="cartographer_ros-release-release-melodic-cartographer_rviz"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-gbp/cartographer_ros-release/archive/release/melodic/cartographer_rviz/${pkgver}.tar.gz"
CMakeLists.patch)
sha256sums=('6b9bc233a6e64b0a737797fff2eb0e1b9217cd990cc98f8d62e12c95bee73ef6'
'7e706acef5e7029a50acee352221a035605ecc51b81d32f795f9c1c9be646556')

prepare() {
    cd "${srcdir}/${_dir}"
    patch -uN CMakeLists.txt ../CMakeLists.patch || return 1
}

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build project
    cmake ${srcdir}/${_dir} \
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_ENABLE_TESTING=0 \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DPYTHON_INCLUDE_DIR=/usr/include/python3.9 \
            -DPYTHON_LIBRARY=/usr/lib/libpython3.9.so \
            -DPYTHON_BASENAME=-python3.9 \
            -DSETUPTOOLS_DEB_LAYOUT=OFF
            make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}

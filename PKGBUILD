# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="IMU rviz plugin"
url='https://wiki.ros.org/rviz_imu_plugin?distro=noetic'

pkgname='ros-noetic-rviz-imu-plugin'
pkgver='1.2.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
  ros-noetic-catkin
  ros-noetic-roscpp
  ros-noetic-rviz
)
makedepends=(
  cmake
  ros-build-tools
  ${ros_makedepends[@]}
  qt5-base
)

ros_depends=(
  ros-noetic-roscpp
  ros-noetic-rviz
)
depends=(
  ${ros_depends[@]}
  qt5-base
)

# Tarball version (faster download)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ccny-ros-pkg/imu_tools/archive/${pkgver}.tar.gz")
sha256sums=('21a0759cba983595bfe5c09e8c85c5bd597ea8cafea7bb5259638b73e3f1c101')

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build project
    cmake ${srcdir}/imu_tools-${pkgver}/rviz_imu_plugin \
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}

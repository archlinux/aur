# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgdesc="Node/nodelet combination to transform sensor_msgs::Imu data from one frame into another."
url='https://wiki.ros.org/imu_transformer'

pkgname='ros-noetic-imu-transformer'
pkgver='0.3.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('GPL')

ros_makedepends=(
  ros-noetic-catkin
  ros-noetic-cmake-modules
  ros-noetic-roscpp
)

makedepends=(
  'cmake'
  'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-geometry-msgs
  ros-noetic-nodelet
  ros-noetic-message-filters
  ros-noetic-sensor-msgs
  ros-noetic-tf2
  ros-noetic-tf2-ros
  ros-noetic-tf2-sensor-msgs
  ros-noetic-topic-tools
)

depends=(
  ${ros_depends[@]}
)

_dir="imu_pipeline-${pkgver}/imu_transformer"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/imu_pipeline/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a591ef9ade15ed8e5893ee0452765ea9eb34bde094329a287ade459e39f40ad0')

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Build project
    cmake -S ${_dir} -B build \
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DSETUPTOOLS_DEB_LAYOUT=OFF
    make -C build --no-print-directory
}

package() {
    make -C build DESTDIR="${pkgdir}/" install --no-print-directory
}

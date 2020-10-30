pkgdesc="ROS - wrapper for libviso2"
url='https://wiki.ros.org/viso2'

pkgname='ros-noetic-viso2-ros'
pkgver='0.0.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('GPL')

ros_makedepends=(
    ros-noetic-libviso2
    ros-noetic-roscpp
    ros-noetic-rostime
    ros-noetic-rosconsole
    ros-noetic-cv-bridge
    ros-noetic-image-geometry
    ros-noetic-tf
    ros-noetic-image-transport
    ros-noetic-message-filters
)
makedepends=(
    cmake
    ros-build-tools
    boost-libs
    opencv
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-libviso2
    ros-noetic-roscpp
    ros-noetic-rostime
    ros-noetic-rosconsole
    ros-noetic-cv-bridge
    ros-noetic-image-geometry
    ros-noetic-tf
    ros-noetic-image-transport
    ros-noetic-message-filters
)
depends=(
    cmake
    ros-build-tools
    boost-libs
    opencv
    ${ros_depends[@]}
)

_dir="viso2/viso2_ros"
source=("viso2"::"git+https://github.com/srv/viso2.git")
sha256sums=('SKIP')

prepare() {
    # Fix wrong header include directory
    sed -i "/#include <viso_/s/viso_/libviso2\/&/" ${srcdir}/${_dir}/src/{mono_odometer.cpp,odometry_params.h,stereo_odometer.cpp}
    # Add installation for binaries
    echo 'install(TARGETS mono_odometer stereo_odometer DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION})' >> ${srcdir}/${_dir}/CMakeLists.txt
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
          -DCATKIN_BUILD_BINARY_PACKAGE=ON \
          -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
          -DPYTHON_EXECUTABLE=/usr/bin/python \
          -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}

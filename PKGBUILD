pkgdesc="ROS - hector_map_server provides a service for retrieving the map, as well as for raycasting based obstacle queries (finds next obstacle in the map, given start and endpoint
    in any tf coordinate frame)."
url='https://wiki.ros.org/hector_map_server'

pkgname='ros-noetic-hector-map-server'
pkgver='0.5.2'
arch=('x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-roscpp
    ros-noetic-hector-map-tools
    ros-noetic-hector-marker-drawing
    ros-noetic-hector-nav-msgs
    ros-noetic-nav-msgs
    ros-noetic-tf
)

depends=(
    ${ros_depends[@]}
)

_dir="hector_slam-${pkgver}/hector_map_server"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tu-darmstadt-ros-pkg/hector_slam/archive/${pkgver}.tar.gz")
sha256sums=('c4c94b75062c1849c720b6c21d9fdea8dbd14e96a17c0ee80c630f3c8ea740fd')

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

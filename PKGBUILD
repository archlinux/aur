pkgdesc="ROS - hector_compressed_map_transport provides means for transporting compressed map data through the use of image_transport."
url='https://wiki.ros.org/hector_compressed_map_transport'

pkgname='ros-noetic-hector-compressed-map-transport'
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
    ros-noetic-geometry-msgs
    ros-noetic-hector-map-tools
    ros-noetic-image-transport
    ros-noetic-nav-msgs
    ros-noetic-sensor-msgs
    ros-noetic-cv-bridge
)

depends=(
    ${ros_depends[@]}
    eigen
)

_dir="hector_slam-${pkgver}/hector_compressed_map_transport"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/tu-darmstadt-ros-pkg/hector_slam/archive/${pkgver}.tar.gz"
    "eigen.patch"
)
sha256sums=(
    'c4c94b75062c1849c720b6c21d9fdea8dbd14e96a17c0ee80c630f3c8ea740fd'
    '14a40823d9b8b8869d0cb1386140de95e73d51f08e7ecd89995e1e700c19b494'
)

prepare() {
    cd "${srcdir}/${_dir}"
    patch -Np0 -i "${srcdir}/eigen.patch"
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

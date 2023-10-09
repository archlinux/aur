pkgdesc="ROS - hector_geotiff provides a node that can be used to save occupancy grid map, robot trajectory and object of interest data to RoboCup Rescue compliant GeoTiff images."
url='https://wiki.ros.org/hector_geotiff'

pkgname='ros-noetic-hector-geotiff'
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
    ros-noetic-hector-map-tools
    ros-noetic-hector-nav-msgs
    ros-noetic-nav-msgs
    ros-noetic-pluginlib
    ros-noetic-roscpp
    ros-noetic-std-msgs
)

depends=(
    ${ros_depends[@]}
    eigen
    qt5-base
    qt5-imageformats
)

_dir="hector_slam-${pkgver}/hector_geotiff"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/tu-darmstadt-ros-pkg/hector_slam/archive/${pkgver}.tar.gz"
    "eigen.patch"
)
sha256sums=(
    'c4c94b75062c1849c720b6c21d9fdea8dbd14e96a17c0ee80c630f3c8ea740fd'
    '96755f178944dfeeae128ec2f97368dac9273aece84d61bd9f9119cd9092ae1d'
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

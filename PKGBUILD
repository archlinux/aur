pkgdesc="ROS - hector_mapping is an SLAM approach that can be used without odometry as well as on platforms that exhibit roll/pitch motion (of the sensor, the platform or both)."
url='https://wiki.ros.org/hector_mapping'

pkgname='ros-noetic-hector-mapping'
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
    ros-noetic-nav-msgs
    ros-noetic-visualization-msgs
    ros-noetic-tf
    ros-noetic-message-filters
    ros-noetic-laser-geometry
    ros-noetic-message-generation
    ros-noetic-message-runtime
)

depends=(
    ${ros_depends[@]}
    eigen
    boost
)

_dir="hector_slam-${pkgver}/hector_mapping"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/tu-darmstadt-ros-pkg/hector_slam/archive/${pkgver}.tar.gz"
    "eigen.patch"
)
sha256sums=(
    'c4c94b75062c1849c720b6c21d9fdea8dbd14e96a17c0ee80c630f3c8ea740fd'
    '8b3c532af9520440ccd9c693fb71c1138734f1b8c7ea46011d7ad94f865b1c48'
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

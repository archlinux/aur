pkgdesc="ROS - Clearpath OutdoorNav URDF description"
url='https://github.com/cpr-application/cpr_onav_description'

pkgname='ros-noetic-cpr-onav-description'
pkgver='0.1.9'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=("BSD")

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-lms1xx
    ros-noetic-realsense2-description
    ros-noetic-velodyne-description
    ros-noetic-urdf
    ros-noetic-xacro
)

depends=(
    ${ros_depends[@]}
)

_dir="cpr_onav_description-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cpr-application/cpr_onav_description/archive/${pkgver}.tar.gz")
sha256sums=('9c2136aa4784bc4eddbdbb5a7d897201b0060115ad4015adcaad7268edbffd65')

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

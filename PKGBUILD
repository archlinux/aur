pkgdesc="ROS - URDF and meshes describing Velodyne laser scanners"
url='http://wiki.ros.org/velodyne_description'

pkgname='ros-noetic-velodyne-description'
pkgver='1.0.13'
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
    ros-noetic-urdf
    ros-noetic-xacro
)

depends=(
    ${ros_depends[@]}
)

_dir="DataspeedInc-velodyne_simulator-b98e156c4431/velodyne_description"
source=("${pkgname}-${pkgver}.zip::https://bitbucket.org/DataspeedInc/velodyne_simulator/get/b98e156c4431.zip")
sha256sums=('6b378ea9e47d9436e35da8ada4879f336e4c27b5a1194993d12ba43b060150f1')

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

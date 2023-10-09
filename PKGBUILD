pkgdesc="ROS - Launchfiles to use Jackal in Gazebo."
url='https://github.com/jackal/jackal_simulator'

pkgname='ros-noetic-jackal-gazebo'
pkgver='0.4.0'
arch=('x86_64')
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
    ros-noetic-roslaunch
    ros-noetic-gazebo-ros
    ros-noetic-gazebo-ros-control
    ros-noetic-gazebo-plugins
    ros-noetic-hector-gazebo-plugins
    ros-noetic-jackal-control
    ros-noetic-jackal-description
)

depends=(
    ${ros_depends[@]}
)

_dir="jackal_simulator-${pkgver}/jackal_gazebo"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jackal/jackal_simulator/archive/${pkgver}.tar.gz")
sha256sums=('6062601f647560e402eb7a1a6829c9d8711b1025f712ae9dd935ca05c261ba31')

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

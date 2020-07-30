pkgdesc="ROS - Graphical frontend for interacting with the controller manager."
url='http://wiki.ros.org/rqt_controller_manager'

pkgname='ros-noetic-rqt-controller-manager'
pkgver='0.19.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    python-setuptools
)

ros_depends=(
    ros-noetic-controller-manager-msgs
    ros-noetic-rospy
    ros-noetic-rqt-gui
    ros-noetic-rqt-gui-py
)

depends=(
    ${ros_depends[@]}
)

_dir="ros_control-${pkgver}/rqt_controller_manager"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/ros_control/archive/${pkgver}.tar.gz")
sha256sums=('9b39e47e78c43f36c378c0557a68b4ba35f1f723314cbd541a460e6a340bc4ae')

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create the build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build the project
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

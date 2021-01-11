pkgdesc="ROS -  MoveIt Resources for testing: Franka Emika Panda A project-internal configuration for testing in MoveIt."
url='https://wiki.ros.org/moveit_resources'

pkgname='ros-noetic-moveit-resources-panda-moveit-config'
pkgver='0.7.1'
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
)

ros_depends=(
    ros-noetic-xacro
    ros-noetic-robot-state-publisher
    ros-noetic-moveit-resources-panda-description
    ros-noetic-joint-state-publisher
    ros-noetic-joint-state-publisher-gui
    ros-noetic-topic-tools
)

depends=(
    ${ros_depends[@]}
)

_dir="moveit_resources-${pkgver}/panda_moveit_config"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit_resources/archive/${pkgver}.tar.gz")
sha256sums=('1b6364d808fbfa01bbc302fc66821ef0bd564b67be0e2ab9e394c5931ac3dc07')


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

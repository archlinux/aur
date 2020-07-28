pkgdesc="ROS - Graphical frontend for interacting with joint_trajectory_controller instances."
url='http://wiki.ros.org/rqt_joint_trajectory_controller'

pkgname='ros-noetic-rqt-joint-trajectory-controller'
pkgver='0.17.0'
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
    ros-noetic-control-msgs
    ros-noetic-controller-manager-msgs
    ros-noetic-trajectory-msgs
    ros-noetic-rospy
    ros-noetic-rqt-gui
    ros-noetic-rqt-gui-py
)

depends=(${ros_depends[@]})

_dir="ros_controllers-${pkgver}/rqt_joint_trajectory_controller"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/ros_controllers/archive/${pkgver}.tar.gz")
sha256sums=('d1b46651956d19a36eedc628c2761526ec4769390e596bd76688abc45f59ace8')

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

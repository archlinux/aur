pkgdesc="ROS - Components of MoveIt that offer simpler interfaces to planning and execution."
url='https://wiki.ros.org/moveit_ros_planning_interface'

pkgname='ros-noetic-moveit-ros-planning-interface'
pkgver='1.0.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-tf-conversions
  ros-noetic-tf
  ros-noetic-moveit-ros-move-group
  ros-noetic-moveit-ros-warehouse
  ros-noetic-rospy
  ros-noetic-roscpp
  ros-noetic-moveit-ros-planning
  ros-noetic-actionlib
  ros-noetic-eigen-conversions
  ros-noetic-moveit-ros-manipulation
  ros-noetic-rosconsole
  ros-noetic-moveit-resources
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python
  python-catkin-pkg
  eigen)

ros_depends=(ros-noetic-tf-conversions
  ros-noetic-tf
  ros-noetic-moveit-ros-move-group
  ros-noetic-moveit-ros-warehouse
  ros-noetic-rospy
  ros-noetic-roscpp
  ros-noetic-moveit-ros-planning
  ros-noetic-actionlib
  ros-noetic-eigen-conversions
  ros-noetic-moveit-ros-manipulation
  ros-noetic-rosconsole)
depends=(${ros_depends[@]}
  python
  eigenpy)

_dir="moveit-${pkgver}/moveit_ros/planning_interface"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz"
        "eigenpy.patch"::"https://patch-diff.githubusercontent.com/raw/ros-planning/moveit/pull/2117.patch")
sha256sums=('b0ac91cd4c4dc29d9bd5e3885a1a457252495b3f2bedb46ddfe04154f5ac2358'
            '9b678848cd2614cf1155bfead3bd0d54d671cb1c9df5ec73b9b5ad2ad1cd1563')

prepare() {
    cd moveit-${pkgver}
    patch --forward --strip=1 --input="${srcdir}/eigenpy.patch"
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

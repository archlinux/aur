# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - franka_ros is a metapackage for all Franka Emika ROS packages."
url='h'

pkgname='ros-melodic-franka-ros'
pkgver='0.6.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('Apache 2.0')

ros_makedepends=(
  ros-melodic-catkin
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-panda-moveit-config
  ros-melodic-franka-description
  ros-melodic-franka-gripper
  ros-melodic-franka-example-controllers
  ros-melodic-franka-control
  ros-melodic-franka-msgs
  ros-melodic-franka-visualization
  ros-melodic-franka-hw
)

depends=(
  ${ros_depends[@]}
)

_dir="franka_ros-release-release-melodic-franka_ros"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/frankaemika/franka_ros-release/archive/release/melodic/franka_ros/${pkgver}.tar.gz")
sha256sums=('98d7bdd1b163b10f0e9ff3242b393bb61fa04feb7a23def2a44b127391843d96')


build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCATKIN_BUILD_BINARY_PACKAGE=ON \
    -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

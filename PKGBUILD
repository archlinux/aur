# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - Graphical frontend for interacting with joint_trajectory_controller instances."
url='http://wiki.ros.org/rqt_joint_trajectory_controller'

pkgname='ros-melodic-rqt-joint-trajectory-controller'
pkgver='0.17.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-control-msgs
  ros-melodic-controller-manager-msgs
  ros-melodic-trajectory-msgs
  ros-melodic-rqt-gui-py
  ros-melodic-rospy
  ros-melodic-rqt-gui
)

depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/effort_controllers/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_controllers-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_controllers-${pkgver}/rqt_joint_trajectory_controller"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/ros_controllers/archive/${pkgver}.tar.gz")
sha256sums=('fdd93a3aea7d140b1c04849790e81195f76fb421c7dfa51c86dcf22698f32b3e')

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


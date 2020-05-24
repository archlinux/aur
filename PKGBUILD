# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Components of MoveIt connecting to perception."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-ros-perception'
pkgver='1.0.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-message-filters
  ros-noetic-moveit-core
  ros-noetic-moveit-msgs
  ros-noetic-tf
  ros-noetic-cv-bridge
  ros-noetic-urdf
  ros-noetic-pluginlib
  ros-noetic-roscpp
  ros-noetic-octomap
  ros-noetic-sensor-msgs
  ros-noetic-image-transport
  ros-noetic-tf-conversions
  ros-noetic-tf2-geometry-msgs
  ros-noetic-rosconsole
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  glut
  mesa-libgl
  eigen
  glew)

ros_depends=(ros-noetic-message-filters
  ros-noetic-moveit-core
  ros-noetic-moveit-msgs
  ros-noetic-tf
  ros-noetic-cv-bridge
  ros-noetic-urdf
  ros-noetic-pluginlib
  ros-noetic-roscpp
  ros-noetic-octomap
  ros-noetic-sensor-msgs
  ros-noetic-image-transport
  ros-noetic-tf-conversions
  ros-noetic-tf2-geometry-msgs
  ros-noetic-rosconsole)
depends=(${ros_depends[@]}
  glut
  glew
  mesa-libgl)

# Git version (e.g. for debugging)
# _tag=release/noetic/moveit_ros_perception/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('8bcc6469b26ee9f06598c3793fc56bae2c4ce71d7a27171ab1ddd591f16dacc5')

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_ros/perception"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('b8194308c57dbe34bbb729cfccb30d1113af3a54a90a2cfb49482142d1044ea4')

prepare() {
  cd ${srcdir}
  find . \( -iname *.cpp -o -iname *.h \) \
	  -exec sed -r -i "s/[^_]logError/CONSOLE_BRIDGE_logError/" {} \; \
	  -exec sed -r -i "s/[^_]logWarn/CONSOLE_BRIDGE_logWarn/" {} \; \
	  -exec sed -r -i "s/[^_]logDebug/CONSOLE_BRIDGE_logDebug/" {} \; \
	  -exec sed -r -i "s/[^_]logInform/CONSOLE_BRIDGE_logInform/" {} \;
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

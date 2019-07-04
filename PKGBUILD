# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Components of MoveIt connecting to perception."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-ros-perception'
pkgver='0.10.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-message-filters
  ros-melodic-moveit-core
  ros-melodic-moveit-msgs
  ros-melodic-tf
  ros-melodic-cv-bridge
  ros-melodic-urdf
  ros-melodic-pluginlib
  ros-melodic-roscpp
  ros-melodic-octomap
  ros-melodic-sensor-msgs
  ros-melodic-image-transport
  ros-melodic-tf-conversions
  ros-melodic-tf2-geometry-msgs
  ros-melodic-rosconsole
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  glut
  mesa-libgl
  eigen
  glew)

ros_depends=(ros-melodic-message-filters
  ros-melodic-moveit-core
  ros-melodic-moveit-msgs
  ros-melodic-tf
  ros-melodic-cv-bridge
  ros-melodic-urdf
  ros-melodic-pluginlib
  ros-melodic-roscpp
  ros-melodic-octomap
  ros-melodic-sensor-msgs
  ros-melodic-image-transport
  ros-melodic-tf-conversions
  ros-melodic-tf2-geometry-msgs
  ros-melodic-rosconsole)
depends=(${ros_depends[@]}
  glut
  glew
  mesa-libgl)

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_ros_perception/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('8bcc6469b26ee9f06598c3793fc56bae2c4ce71d7a27171ab1ddd591f16dacc5')

# Tarball version (faster download)
_dir="moveit-release-release-melodic-moveit_ros_perception-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/melodic/moveit_ros_perception/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('3c620d6a5d339999163f3b98a35e4c4c9a78ed43d07f5da934877c9bf3da4dc1')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=-python3.7m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

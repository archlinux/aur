# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Components of MoveIt connecting to perception."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-ros-perception'
pkgver='1.0.8'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-melodic-catkin
  ros-melodic-cv-bridge
  ros-melodic-image-transport
  ros-melodic-message-filters
  ros-melodic-moveit-core
  ros-melodic-moveit-msgs
  ros-melodic-moveit-ros-occupancy-map-monitor
  ros-melodic-moveit-ros-planning
  ros-melodic-nodelet
  ros-melodic-object-recognition-msgs
  ros-melodic-octomap
  ros-melodic-pluginlib
  ros-melodic-rosconsole
  ros-melodic-roscpp
  ros-melodic-sensor-msgs
  ros-melodic-tf
  ros-melodic-tf-conversions
  ros-melodic-tf2
  ros-melodic-tf2-eigen
  ros-melodic-tf2-geometry-msgs
  ros-melodic-tf2-ros
  ros-melodic-urdf
  )
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  glut
  mesa-libgl
  eigen
  glew)

ros_depends=(
  ros-melodic-cv-bridge
  ros-melodic-image-transport
  ros-melodic-message-filters
  ros-melodic-moveit-core
  ros-melodic-moveit-msgs
  ros-melodic-moveit-ros-occupancy-map-monitor
  ros-melodic-moveit-ros-planning
  ros-melodic-nodelet
  ros-melodic-object-recognition-msgs
  ros-melodic-octomap
  ros-melodic-pluginlib
  ros-melodic-rosconsole
  ros-melodic-roscpp
  ros-melodic-sensor-msgs
  ros-melodic-tf
  ros-melodic-tf-conversions
  ros-melodic-tf2
  ros-melodic-tf2-eigen
  ros-melodic-tf2-geometry-msgs
  ros-melodic-tf2-ros
  ros-melodic-urdf
  )
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
_dir="moveit-${pkgver}/moveit_ros/perception"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('9f94cac094e0cd73caf2fb75ff85870045239806852aa00f6122f4785da23c14')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DBOOST_ROOT=/opt/boost1.69 \
        -DBoost_NO_SYSTEM_PATHS=TRUE
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Generates a configuration package that makes it easy to use MoveIt!."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-setup-assistant'
pkgver='1.0.8'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-srdfdom
  ros-melodic-moveit-core
  ros-melodic-catkin
  ros-melodic-moveit-ros-planning
  ros-melodic-moveit-resources
  ros-melodic-moveit-ros-visualization)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  yaml-cpp)

ros_depends=(ros-melodic-srdfdom
  ros-melodic-xacro
  ros-melodic-moveit-core
  ros-melodic-moveit-ros-planning
  ros-melodic-moveit-ros-visualization)
depends=(${ros_depends[@]}
  yaml-cpp)

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_setup_assistant/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('44b21865d318f1cfb13846b72df494b6eb461f814dec78af71f9e7eb6981f537')

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_setup_assistant"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('9f94cac094e0cd73caf2fb75ff85870045239806852aa00f6122f4785da23c14')

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

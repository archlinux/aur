# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Generates a configuration package that makes it easy to use MoveIt!."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-setup-assistant'
pkgver='1.0.2'
arch=('any')
pkgrel=2
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
sha256sums=('b8194308c57dbe34bbb729cfccb30d1113af3a54a90a2cfb49482142d1044ea4')

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

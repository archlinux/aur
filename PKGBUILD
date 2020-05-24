# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Generates a configuration package that makes it easy to use MoveIt!."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-setup-assistant'
pkgver='1.0.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-noetic-srdfdom
  ros-noetic-moveit-core
  ros-noetic-catkin
  ros-noetic-moveit-ros-planning
  ros-noetic-moveit-resources
  ros-noetic-moveit-ros-visualization)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  yaml-cpp)

ros_depends=(ros-noetic-srdfdom
  ros-noetic-xacro
  ros-noetic-moveit-core
  ros-noetic-moveit-ros-planning
  ros-noetic-moveit-ros-visualization)
depends=(${ros_depends[@]}
  yaml-cpp)

# Git version (e.g. for debugging)
# _tag=release/noetic/moveit_setup_assistant/${pkgver}-${_pkgver_patch}
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

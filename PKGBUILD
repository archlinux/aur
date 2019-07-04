# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Components of MoveIt connecting to MongoDB."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-ros-warehouse'
pkgver='0.10.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-tf
  ros-melodic-warehouse-ros
  ros-melodic-roscpp
  ros-melodic-moveit-ros-planning
  ros-melodic-rosconsole
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-warehouse-ros
  ros-melodic-roscpp
  ros-melodic-moveit-ros-planning
  ros-melodic-rosconsole
  ros-melodic-tf)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_ros_warehouse/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('43d6173332d19c008103c4f1fb1a114f8fab9d1010c717f4efe24e88e2b32a28')

# Tarball version (faster download)
_dir="moveit-release-release-melodic-moveit_ros_warehouse-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/melodic/moveit_ros_warehouse/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('9709806c5394b46b9f5a6660698054a374f0058bb1502a5885f2996e3721e1b5')

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

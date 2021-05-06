# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Resources used for MoveIt! testing."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-resources'
pkgver='0.7.3'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-joint-state-publisher
  ros-melodic-robot-state-publisher
  ros-melodic-moveit-resources-fanuc-description
  ros-melodic-moveit-resources-fanuc-moveit-config
  ros-melodic-moveit-resources-panda-description
  ros-melodic-moveit-resources-panda-moveit-config
  ros-melodic-moveit-resources-pr2-description
)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_resources/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit_resources-release.git"#tag=${_tag})
# sha256sums=('d98d7e113ff2313fdbc0799a2abf4dc39f462bf7dc904b9b9584cbe241883ab6')

# Tarball version (faster download)
_dir="moveit_resources-${pkgver}/moveit_resources"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit_resources/archive/${pkgver}.tar.gz")
sha256sums=('cad98a19a93856f5b49bcbff2e9671ab1c27e266af981586e908833cca5d9c86')

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

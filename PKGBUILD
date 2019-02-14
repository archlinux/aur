# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - 3D visualization tool for ROS."
url='http://ros.org/wiki/rviz'

pkgname='ros-indigo-rviz'
pkgver='1.11.19'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD, Creative Commons')

ros_makedepends=(ros-indigo-geometry-msgs
  ros-indigo-python-qt-binding
  ros-indigo-rospy
  ros-indigo-nav-msgs
  ros-indigo-visualization-msgs
  ros-indigo-interactive-markers
  ros-indigo-roscpp
  ros-indigo-std-msgs
  ros-indigo-map-msgs
  ros-indigo-rosconsole
  ros-indigo-laser-geometry
  ros-indigo-cmake-modules
  ros-indigo-tf
  ros-indigo-urdf
  ros-indigo-image-geometry
  ros-indigo-rosbag
  ros-indigo-sensor-msgs
  ros-indigo-std-srvs
  ros-indigo-pluginlib
  ros-indigo-resource-retriever
  ros-indigo-catkin
  ros-indigo-image-transport
  ros-indigo-roslib
  ros-indigo-message-filters)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  qt4
  ogre-1.9
  assimp
  eigen3
  tinyxml
  mesa
  yaml-cpp)

ros_depends=(ros-indigo-geometry-msgs
  ros-indigo-python-qt-binding
  ros-indigo-rospy
  ros-indigo-nav-msgs
  ros-indigo-visualization-msgs
  ros-indigo-interactive-markers
  ros-indigo-roscpp
  ros-indigo-std-msgs
  ros-indigo-map-msgs
  ros-indigo-rosconsole
  ros-indigo-laser-geometry
  ros-indigo-media-export
  ros-indigo-tf
  ros-indigo-urdf
  ros-indigo-image-geometry
  ros-indigo-rosbag
  ros-indigo-sensor-msgs
  ros-indigo-std-srvs
  ros-indigo-pluginlib
  ros-indigo-resource-retriever
  ros-indigo-image-transport
  ros-indigo-roslib
  ros-indigo-message-filters)
depends=(${ros_depends[@]}
  qt4
  ogre-1.9
  assimp
  eigen3
  tinyxml
  mesa
  yaml-cpp)

# Git version (e.g. for debugging)
# _tag=release/indigo/rviz/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rviz-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rviz-release-release-indigo-rviz-${pkgver}-${_pkgver_patch}"
source=(
  "${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rviz-release/archive/release/indigo/rviz/${pkgver}-${_pkgver_patch}.tar.gz"
  'use-ogre-1.9.patch'
)
sha256sums=('74fdb4f4806aa68afa533c83014315e5790f2279d0b256c7d68164e4ff0de50f'
            'fa3dbb6e00c70afb65e5a5bda131975039727034d3d2e04b80b0e620b6286907')

prepare() {
  # Apply patch
  cd "${srcdir}/${_dir}"
  patch -p1 -i "${srcdir}/use-ogre-1.9.patch"
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DUseQt5=ON \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

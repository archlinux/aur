# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - This library loads a 3D map (as Octree-based OctoMap) and distributes it to other nodes in a compact binary format"
url='http://ros.org/wiki/random_numbers'

pkgname='ros-melodic-octomap-server'
pkgver='0.6.5'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin
  ros-melodic-roscpp
  ros-melodic-visualization-msgs
  ros-melodic-sensor-msgs
  ros-melodic-pcl-ros
  ros-melodic-pcl-conversions
  ros-melodic-nav-msgs
  ros-melodic-std-msgs
  ros-melodic-std-srvs
  ros-melodic-octomap
  ros-melodic-octomap-msgs  
  ros-melodic-octomap-ros
  ros-melodic-dynamic-reconfigure
  ros-melodic-nodelet   
)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost)

ros_depends=(ros-melodic-roscpp
  ros-melodic-visualization-msgs
  ros-melodic-sensor-msgs
  ros-melodic-pcl-ros
  ros-melodic-pcl-conversions
  ros-melodic-nav-msgs
  ros-melodic-std-msgs
  ros-melodic-std-srvs
  ros-melodic-octomap
  ros-melodic-octomap-msgs
  ros-melodic-octomap-ros
  ros-melodic-dynamic-reconfigure
  ros-melodic-nodelet
)
depends=(${ros_depends[@]}
  boost)

# Git version (e.g. for debugging)
# _tag=release/melodic/octomap_mapping/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/OctoMap/octomap_mapping.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="octomap_mapping-master/octomap_server"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/OctoMap/octomap_mapping/archive/master/octomap_mapping/${pkgver}.tar.gz"
        "export_nodelet_macro.patch")

sha256sums=('ac14c36ac5ac7e17b2ade091abaaa33afeecc813fc85ee91f208fca0e38d4d32'
            'SKIP')

prepare() {
  cd ${srcdir}/${_dir}
  patch -Np1 -i ${srcdir}/export_nodelet_macro.patch
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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.8 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.8.so \
        -DPYTHON_BASENAME=-python3.8 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}


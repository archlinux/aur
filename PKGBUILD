# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Teb local  Planner  provides a path planning algorithm for ROS"

pkgname='ros-kinetic-teb-local-planner'
pkgver='0.7.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'  'pkg-config' ${ros_makedepends[@]})

ros_depends=(ros-kinetic-roscpp 
ros-kinetic-base-local-planner 
ros-kinetic-nav-core 
ros-kinetic-pluginlib 
ros-kinetic-geometry-msgs 
ros-kinetic-nav-msgs
ros-kinetic-message-generation
ros-kinetic-catkin
ros-kinetic-costmap-2d
ros-kinetic-costmap-converter
ros-kinetic-dynamic-reconfigure
ros-kinetic-interactive-markers
ros-kinetic-message-runtime
g2o
ros-kinetic-roscpp
ros-kinetic-std-msgs
ros-kinetic-tf
ros-kinetic-tf-conversions
ros-kinetic-visualization-msgs)
depends=(${ros_depends[@]}
  python2-rospkg)

# Git version (e.g. for debugging)
_tag=${pkgver}
_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/rst-tu-dortmund/teb_local_planner.git#tag=${_tag}"
        "https://raw.githubusercontent.com/majorx234/FindG2O.cmake.patch/master/FindG2O.cmake.patch")
sha256sums=('SKIP'
            'c6b5c6ed189a2b022a1feeb76d8617f837f63980f2079ef779923d5cbe91a452')
options=('!makeflags')  

prepare() {
  cd ${srcdir}/${_dir}

  patch -Np1 < $srcdir/../FindG2O.cmake.patch
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${pkgname} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
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


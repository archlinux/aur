# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - RTAB-Maps standalone library."
url='http://introlab.github.io/rtabmap'

pkgname='ros-kinetic-rtabmap'
pkgver='0.19.3'
_pkgver_patch=1
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-octomap
  ros-kinetic-qt-gui-cpp
  ros-kinetic-cv-bridge)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  sqlite
  vtk
  zlib
  proj
  pcl
)

ros_depends=(ros-kinetic-octomap
  ros-kinetic-qt-gui-cpp
  ros-kinetic-cv-bridge)
depends=(${ros_depends[@]}
  sqlite
  vtk
  zlib
  pcl
  )

# Git version (e.g. for debugging)
# _tag=release/kinetic/rtabmap/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/introlab/rtabmap-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rtabmap-release-release-kinetic-rtabmap-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/introlab/rtabmap-release/archive/release/kinetic/rtabmap/${pkgver}-${_pkgver_patch}.tar.gz"
       "CloudViewer_vtkTexture.patch")
sha256sums=('fc22b6b3288611f0f77c8ec0686604f041349ccb1b086dd3314f9704d2245e20'
            'SKIP')

prepare() {
  cd ${srcdir}/${_dir}/guilib/src
  patch -Np1 --binary -i ${srcdir}/CloudViewer_vtkTexture.patch
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
  cmake ${srcdir}/${_dir} \
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

# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Wrapper around yaml-cpp, it provides a fixed CMake module and an ExternalProject build of it."
url='https://github.com/jbeder/yaml-cpp'

pkgname='ros-ardent-rviz-yaml-cpp-vendor'
pkgver='2.0.0'
_pkgver_patch=5
arch=('any')
pkgrel=6
license=('Apache License 2.0, MIT')

ros_makedepends=(ros-ardent-ament-cmake)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=()
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/rviz_yaml_cpp_vendor/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/rviz-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rviz-release-release-ardent-rviz_yaml_cpp_vendor-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/rviz-release/archive/release/ardent/rviz_yaml_cpp_vendor/${pkgver}-${_pkgver_patch}.tar.gz" "vendor_only.patch")
sha256sums=('a8812a7ae698b6f2a3d59c0aac82ed3881734f476e8d8ca28af2f5577c9e2cb4' "99ff35aec7d83dc2e818e735bfc3afa9cbd9884e39e0bc4123a35ab155ec02df")

prepare() {
  cd "${srcdir}"
  patch -Np1 -i "vendor_only.patch"
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/ardent/setup.bash ] && source /opt/ros/ardent/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 "${srcdir}/${_dir}"

  export PYTHONPATH=/opt/ros/ardent/lib/python3.6/site-packages
  export AMENT_PREFIX_PATH=/opt/ros/ardent

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=Off \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/ardent
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

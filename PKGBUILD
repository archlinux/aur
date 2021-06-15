# Script generated with create_pkgbuild.py
# For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
pkgdesc="ROS - This ROS package wraps documentation tools like doxygen, sphinx, and epydoc, making it convenient to generate ROS package documentation."
url='http://wiki.ros.org/rosdoc_lite'

pkgname='ros-melodic-rosdoc-lite'
pkgver='0.2.10'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(ros-melodic-genmsg)
depends=(${ros_depends[@]}
    epydoc
    python-rospkg
    python-yaml
    doxygen
    python-sphinx
    python-kitchen
    python-catkin_pkg)

_dir="rosdoc_lite-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-infrastructure/rosdoc_lite/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('91f81eb47dd835fe5e69e5584a5adf2bc0b7d85831bb5c777ef72fd85e07adfa')


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
          -DPYTHON_INCLUDE_DIR=/usr/include/python3.9m \
          -DPYTHON_LIBRARY=/usr/lib/libpython3.9m.so \
          -DPYTHON_BASENAME=.cpython-39m \
          -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

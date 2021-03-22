pkgdesc="ROS - Library for visual odometry"
url='https://www.wiki.ros.org/viso2'

pkgname='ros-melodic-libviso2'
pkgver='0.0.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('GPL')

makedepends=('cmake' 'gcc-libs' 'git')
depends=('gcc-libs' 'ros-melodic-roscpp' 'ros-melodic-catkin')

_dir="viso2/libviso2"
source=("viso2"::"git+https://github.com/srv/viso2.git")
sha256sums=('SKIP')

prepare() {
  sed -i -e "/install(DIRECTORY/s/$/\//" -e "/PATTERN/s/.cpp/*.cpp/" ${srcdir}/${_dir}/CMakeLists.txt
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

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

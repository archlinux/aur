# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="ROS - Cartographer is a system that provides real-time simultaneous localization and mapping (SLAM) in 2D and 3D across multiple platforms and sensor configurations."
url='https://github.com/googlecartographer/cartographer'

pkgname='ros-noetic-cartographer-git'
pkgver=r1164.3abea342
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('Apache 2.0')
provides=(${pkgname::-4})

ros_makedepends=(ros-noetic-catkin)
makedepends=(
  cmake
  ros-build-tools
  ${ros_makedepends[@]}
  boost
  google-glog
  protobuf
  cairo
  lua52
  python-sphinx
  gcc
  gflags
  eigen
  ceres-solver-legacy
  abseil-cpp-git
  gmock
)

ros_depends=()
depends=(
  ${ros_depends[@]}
  boost
  google-glog
  protobuf
  cairo
  lua52
  gflags
  eigen
  ceres-solver-legacy
  abseil-cpp-git
)

source=($pkgname::git://github.com/cartographer-project/cartographer.git FindGMock.patch)
sha256sums=('SKIP'
            'a109c0927cff5d0a9d8ad7d0f676ce0c3af81a1aa39b88b16a030431cde2cbb4')
            
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    patch --forward --strip=1 --input="${srcdir}/FindGMock.patch"
}

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build project
    cmake ${srcdir}/${pkgname} \
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_ENABLE_TESTING=0 \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DPYTHON_INCLUDE_DIR=/usr/include/python3.9 \
            -DPYTHON_LIBRARY=/usr/lib/libpython3.9.so \
            -DPYTHON_BASENAME=-python3.9 \
            -DSETUPTOOLS_DEB_LAYOUT=OFF \
            -DCMAKE_CXX_STANDARD=17
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}

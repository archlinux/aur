# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="OpenMP boosted NDT and GICP algorithms"
url='https://github.com/koide3/ndt_omp'

pkgname='ros-noetic-ndt-omp-git'
pkgver=r22.c421372
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')
provides=(${pkgname::-4})

ros_makedepends=(
  ros-noetic-catkin
  ros-noetic-cpp-common
  ros-noetic-pcl-ros
)
makedepends=(
  cmake
  ros-build-tools
  ${ros_makedepends[@]}
)

ros_depends=()
depends=(
  ${ros_depends[@]}
  ros-noetic-cpp-common
  ros-noetic-pcl-ros
)

source=(
  $pkgname::git://github.com/koide3/ndt_omp.git
  shared_ptr.patch::https://github.com/koide3/ndt_omp/pull/26.patch
)

sha256sums=(
  'SKIP'
  'e0c0bc7c3a15b1431e674f75fa607f1592457a6093370abdc307ac834ceed4db'
)
 
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch --forward --strip=1 --input="${srcdir}/shared_ptr.patch" 
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
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}

# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="OpenMP boosted NDT and GICP algorithms with CUDA enabled"
url='https://github.com/SMRT-AIST/fast_gicp'

pkgname='ros-noetic-fast-gicp-cuda-git'
pkgver=r115.7798ac5
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD-3-Clause License')
provides=(${pkgname::-9})

makedepends=(
  cmake
  ros-build-tools
)

optdepends=(
  openmp
)

depends=(
  pcl  
  cuda
  eigen
)

source=(
  $pkgname::git://github.com/SMRT-AIST/fast_gicp
  nvbio::https://github.com/NVlabs/nvbio/archive/9bb7e6363c65f65e46f21df09bef98e404250f10.tar.gz
  CMakeLists.patch
)

sha256sums=(
  'SKIP'
  'd8208f7044ab26f8b9dc87898a0265c57346d171375e9e4d8669807cada955cb'
  'f8f05e0f64b6d5e987f4f21ab780e46338ff858e561cb4db0a93046620fcecc9'
)
 
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd $srcdir
  mv -n nvbio-9bb7e6363c65f65e46f21df09bef98e404250f10/* $pkgname/thirdparty/nvbio
  cd $pkgname
  patch --forward --strip=1 --input="${srcdir}/CMakeLists.patch"
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
            -DSETUPTOOLS_DEB_LAYOUT=OFF \
            -DBUILD_VGICP_CUDA=ON \
            -DCMAKE_CXX_STANDARD=17
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}

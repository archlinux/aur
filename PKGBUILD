# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="OpenMP boosted NDT and GICP algorithms"
url='https://github.com/SMRT-AIST/fast_gicp'

pkgname='ros-noetic-fast-gicp-git'
pkgver=r115.7798ac5
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD-3-Clause License')
provides=(${pkgname::-4})

makedepends=(
  cmake
  ros-build-tools
  pcl
  cuda
)

optdepends=(
  openmp
)

depends=(
  pcl  
  cuda
)

source=(
  $pkgname::git://github.com/SMRT-AIST/fast_gicp
  eigen::https://github.com/eigenteam/eigen-git-mirror/archive/36b95962756c1fce8e29b1f8bc45967f30773c00.tar.gz
  nvbio::https://github.com/NVlabs/nvbio/archive/9bb7e6363c65f65e46f21df09bef98e404250f10.tar.gz
)

sha256sums=(
  'SKIP'
  'dfa74c7c6fcb4a454d3fb78782268a3e3729ed041771862d68a033862a98dd31'
  'd8208f7044ab26f8b9dc87898a0265c57346d171375e9e4d8669807cada955cb'
)
 
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd $srcdir
  mv -n eigen-git-mirror-36b95962756c1fce8e29b1f8bc45967f30773c00/* $pkgname/thirdparty/Eigen
  mv -n nvbio-9bb7e6363c65f65e46f21df09bef98e404250f10/* $pkgname/thirdparty/nvbio
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
            -DBUILD_VGICP_CUDA=ON \
            -DCMAKE_CXX_STANDARD=17
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}

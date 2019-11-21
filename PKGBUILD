# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=darknet-alexeyab-git
pkgver=r1469.10c4055
pkgrel=1
pkgdesc='YOLO: Real Time Object Detection Neural Network Library (AlexeyAB fork)'
arch=('i686' 'x86_64')
url='https://github.com/AlexeyAB/darknet'
license=('YOLO')
depends=()
optdepends=('cuda' 'cudnn' 'opencv')
makedepends=('cmake' 'git' 'vtk')
_name=darknet
provides=('darknet')
conflicts=()
source=("git+https://github.com/AlexeyAB/darknet.git"
        LICENSE)
md5sums=('SKIP'
         '4714f70f7f315d04508e3fd63d9b9232')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() { # Creating build directory
  cd "${srcdir}/${_name}/"
  mkdir -p "build-release"
  cd "build-release"

  msg "Starting CMake"

  cmake .. \
    -DCMAKE_PREFIX_PATH='/usr' \
    -DCMAKE_INSTALL_PREFIX='/usr'

  msg "Building the project"
  make
}

package() {
  msg "Installing files"

  #cd "${srcdir}/${_name}/build-release/"
  #make install

  # Create usr directory
  mkdir $pkgdir/usr

  # bin
  mkdir $pkgdir/usr/bin

  # Check if opencv is installed
  if (pacman -Qqs opencv >/dev/null) ; then
    cp $srcdir/${_name}/build-release/{darknet,uselib,uselib_track} $pkgdir/usr/bin/
  else
    cp $srcdir/${_name}/build-release/{darknet,uselib} $pkgdir/usr/bin/
  fi

  # include
  mkdir -p $pkgdir/usr/include/darknet
  cp -r $srcdir/${_name}/include/{darknet.h,yolo_v2_class.hpp} $pkgdir/usr/include/darknet

  # lib
  mkdir $pkgdir/usr/lib
  cp $srcdir/${_name}/build-release/libdark.so $pkgdir/usr/lib/

  # share
  #cp -r $srcdir/${_name}/share $pkgdir/usr/

  chown -R root:root $pkgdir/usr
  chmod -R 755 $pkgdir/usr
}

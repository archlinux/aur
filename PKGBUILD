# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=darknet-alexeyab-git
pkgver=r1330.378d49e
pkgrel=1
pkgdesc='YOLO: Real Time Object Detection Neural Network Library (AlexeyAB fork)'
arch=('i686' 'x86_64')
url='https://github.com/AlexeyAB/darknet'
license=('YOLO')
depends=()
optdepends=('cuda' 'cudnn' 'opencv')
makedepends=('cmake' 'git')
_name=darknet
provides=('darknet')
conflicts=('')
source=("git+https://github.com/AlexeyAB/darknet.git"
        LICENSE)
md5sums=('SKIP'
         '4714f70f7f315d04508e3fd63d9b9232')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

  # Creating build directory
  cd "${srcdir}/${_name}/"
  mkdir -p "build-release"
  cd "build-release"

  msg "Starting CMake"

  cmake .. \
    -DCMAKE_PREFIX_PATH='/usr' \
    -DCMAKE_INSTALL_PREFIX='/usr'

  msg "Building the project"
  make -j4
  make install
}


package() {
  msg "Installing files"

  # Create usr directory
  mkdir $pkgdir/usr

  # bin
  mkdir $pkgdir/usr/bin
  cp $srcdir/${_name}/build-release/{darknet,uselib,uselib_track} $pkgdir/usr/bin/

  # include
  mkdir $pkgdir/usr/include
  cp -r $srcdir/${_name}/include/darknet $pkgdir/usr/include/

  # lib
  mkdir $pkgdir/usr/lib
  cp $srcdir/${_name}/libdark.so $pkgdir/usr/lib/

  # share
  cp -r $srcdir/${_name}/share $pkgdir/usr/

  chown -R root:root $pkgdir/usr
  chmod -R 755 $pkgdir/usr
}

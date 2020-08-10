# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=darknet-alexeyab-git
pkgver=r1994.9dc897d2
pkgrel=1
pkgdesc='YOLO: Real Time Object Detection Neural Network Library (AlexeyAB fork)'
arch=('i686' 'x86_64')
url='https://github.com/AlexeyAB/darknet'
license=('YOLO')
depends=()
optdepends=(opencv)
makedepends=(git cmake cuda cudnn)
_pkgname=darknet
provides=('darknet')
conflicts=()
source=("${_pkgname}::git+https://github.com/AlexeyAB/darknet.git"
        LICENSE)
md5sums=('SKIP'
         '4714f70f7f315d04508e3fd63d9b9232')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "${srcdir}/${_pkgname}/build-release"
  cd "${srcdir}/${_pkgname}/build-release"

  cmake .. \
    -DCMAKE_BUILD_TYPE="Release"

  make
}

package() {
  msg "Installing files"

  cd "${srcdir}/${_pkgname}/build-release/"
  #make DESTDIR="${pkgdir}/" install

  # Create usr directory
  mkdir $pkgdir/usr

  # bin
  mkdir $pkgdir/usr/bin

  # Check if opencv is installed
  if (pacman -Qqs opencv >/dev/null) ; then
    cp $srcdir/${_pkgname}/build-release/{darknet,uselib} $pkgdir/usr/bin/
  else
    cp $srcdir/${_pkgname}/build-release/darknet $pkgdir/usr/bin/
  fi

  # include
  mkdir -p $pkgdir/usr/include/darknet
  cp -r $srcdir/${_pkgname}/include/{darknet.h,yolo_v2_class.hpp} $pkgdir/usr/include/darknet

  # lib
  mkdir $pkgdir/usr/lib
  cp $srcdir/${_pkgname}/build-release/libdarknet.so $pkgdir/usr/lib/

  chown -R root:root $pkgdir/usr
  chmod -R 755 $pkgdir/usr
}

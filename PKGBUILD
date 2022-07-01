# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=darknet-alexeyab-git
pkgver=r2214.eaee5060
pkgrel=1
pkgdesc='YOLO: Real Time Object Detection Neural Network Library (AlexeyAB fork)'
arch=('i686' 'x86_64')
url='https://github.com/AlexeyAB/darknet'
license=('YOLO')
depends=()
makedepends=(git cmake cuda cudnn opencv-cuda)
_pkgname=darknet
provides=('darknet')
conflicts=()
source=("${_pkgname}::git+https://github.com/AlexeyAB/darknet.git"
        LICENSE)
sha256sums=('SKIP'
            '2021f0b8d6426fbf9a2f0126f1e8a7d3b1d7027c871b9979fa2543b9557000c4')

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
  cd "${srcdir}/${_pkgname}/build-release/"
  #make DESTDIR="${pkgdir}/" install

  mkdir $pkgdir/usr

  # bin
  mkdir $pkgdir/usr/bin
  cp $srcdir/${_pkgname}/build-release/{darknet,uselib} $pkgdir/usr/bin/

  # include
  mkdir -p $pkgdir/usr/include/darknet
  cp -r $srcdir/${_pkgname}/include/{darknet.h,yolo_v2_class.hpp} $pkgdir/usr/include/darknet

  # lib
  mkdir $pkgdir/usr/lib
  cp $srcdir/${_pkgname}/build-release/libdarknet.so $pkgdir/usr/lib/

  chown -R root:root $pkgdir/usr
  chmod -R 755 $pkgdir/usr
}

# Maintainer: Parker Reed <parker.l.reed@gmail.com>
pkgname=aasdk-git
_pkgname=aasdk
pkgver=r90.a483733
pkgrel=1
pkgdesc="Library to build AndroidAuto headunit"
arch=('x86_64')
url="https://github.com/f1xpl/${_pkgname}"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('libusb' 'protobuf' 'openssl' 'boost-libs')
makedepends=('cmake' 'boost' 'git')
source=(
  "$pkgname::git+https://github.com/opencardev/aasdk#branch=development"
  promise.patch
)
md5sums=('SKIP'
         '51f3434c41fde193fa7b6d7137bda150')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  patch --forward --strip=1 --input="${srcdir}/promise.patch"
}

build() {
  cd $pkgname
  mkdir -p aasdk_build
  cd aasdk_build
  cmake -DCMAKE_BUILD_TYPE=Release ../  
  make
}

package() {
  cd $pkgname
  install -D -m755 lib/libaasdk.so "$pkgdir/usr/lib/libaasdk.so"
  install -d "$pkgdir/usr/include/aasdk_proto"
  install -D aasdk_build/aasdk_proto/*.h "$pkgdir/usr/include/aasdk_proto"
  install -D -m644 "lib/libaasdk_proto.so" "$pkgdir/usr/lib/libaasdk_proto.so"
  cp -Rv include/f1x/ "$pkgdir/usr/include/"
}

# Maintainer: Parker Reed <parker.l.reed@gmail.com>
pkgname=openauto-git
_pkgname=openauto
pkgver=r121.d7041aa
pkgrel=1
pkgdesc="AndroidAuto headunit emulator"
arch=('x86_64')
url="https://github.com/f1xpl/${_pkgname}"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
optdepends=('android-udev: make phone visible to autoapp via USB')
depends=('aasdk-git' 'qt5-connectivity' 'qt5-multimedia' 'pulseaudio' 'gst-libav' 'gst-plugins-bad' 'rtaudio')
makedepends=('boost' 'cmake' 'chrpath' 'git')
source=("$pkgname::git+https://github.com/abraha2d/openauto#branch=development")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  mkdir -p openauto_build
  cd openauto_build
  cmake -DCMAKE_BUILD_TYPE=Release -DRPI3_BUILD=FALSE -DAASDK_INCLUDE_DIRS="/usr/include" -DAASDK_LIBRARIES="/usr/lib/libaasdk.so" -DAASDK_PROTO_INCLUDE_DIRS="/usr/include" -DAASDK_PROTO_LIBRARIES="/usr/lib/libaasdk_proto.so" ../ 
  make
}

package() {
  cd $pkgname
  #chrpath -d bin/autoapp
  install -D -m755 bin/autoapp "$pkgdir/usr/bin/autoapp"
  install -D -m755 bin/btservice "$pkgdir/usr/bin/btservice"
}

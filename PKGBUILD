# Maintainer: Amael <nils.van-zuijlen@mailo.com>
pkgname=pixymon-git
pkgver=2.r115.55ca01b
pkgrel=1
pkgdesc="Configuration utility for Pixy2 camera"
arch=('x86_64')
url="pixycam.com"
license=('GPL2')
depends=('libusb' 'qt5-base')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/charmedlabs/pixy2.git' 'pixymon.desktop')
noextract=()
md5sums=('SKIP' 'aa7c55dd1f2b4a17e1235b195bfaeeb6')

pkgver() {
  cd "$srcdir/pixy2"
  printf "2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/pixy2"
}

build() {
  cd "$srcdir/pixy2/src/host/pixymon"
  qmake pixymon.pro
  make -w
  strip PixyMon
}

package() {
  cd "$srcdir/pixy2/src/host/pixymon"
  mkdir -p "$pkgdir/usr/bin"
  cp "$srcdir/pixy2/src/host/pixymon/PixyMon" "$pkgdir/usr/bin/"
  cp "$srcdir/pixy2/src/host/pixymon/pixyflash.bin.hdr" "$pkgdir/usr/bin/"

  install -Dm644 "$srcdir/pixy2/src/host/linux/pixy.rules" "$pkgdir/etc/udev/rules.d/pixy.rules"
  install -Dm644 "$srcdir/pixymon.desktop" "$pkgdir/usr/share/applications/pixymon.desktop"
  install -Dm644 "$srcdir/pixy2/src/host/pixymon/icons/pixy.png" "$pkgdir/usr/share/pixmaps/pixymon.png"
}

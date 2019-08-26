# Maintainer: Eric DeStefano <eric at ericdestefano dot com>

pkgname=sheepshaver-git
pkgver=r2604.g143b0827
pkgrel=2
pkgdesc="An Open Source PowerMac Emulator"
arch=('x86_64')
url="http://sheepshaver.cebix.net"
license=('GPL')
depends=('gtk2' 'sdl' 'vde2')
provides=("sheepshaver=$pkgver")
conflicts=("sheepshaver")
source=('git+https://github.com/cebix/macemu'
        'SheepShaver.sysctl'
        'SheepShaver.desktop'
        'SheepShaver.png')
sha256sums=('SKIP'
            'a4aa858b95d29906873693988d5db42d5a4da8aa94a72c79374f59fc488efd51'
            'cb002e73e864a6ca271e0bbaa6df6eb89dc1df86856fc575c20bf79367458c39'
            'b7f67b1f8424f3e0ffa1a5e57597f368c4c4f93ea1f871ec0a76700b7519b241')

pkgver() {
  cd macemu
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd macemu/SheepShaver/src/Unix
  ./autogen.sh \
    --prefix=/usr \
    --enable-addressing=direct \
    --enable-standalone-gui \
    --enable-sdl-audio \
    --enable-sdl-video \
    --enable-tuntap \
    --with-bincue \
    --with-vdeplug \
    ;
  make -j1
}

package() {
  install -Dm755 macemu/SheepShaver/src/Unix/SheepShaver    "$pkgdir"/usr/bin/SheepShaver
  install -Dm755 macemu/SheepShaver/src/Unix/SheepShaverGUI "$pkgdir"/usr/bin/SheepShaverGUI

  mkdir -p "$pkgdir"/usr/share/doc
  cp -a macemu/SheepShaver/doc/Linux "$pkgdir"/usr/share/doc/SheepShaver

  install -Dm644 SheepShaver.desktop "$pkgdir"/usr/share/applications/SheepShaver.desktop
  install -Dm644 SheepShaver.png     "$pkgdir"/usr/share/pixmaps/SheepShaver.png
  install -Dm644 SheepShaver.sysctl  "$pkgdir"/etc/sysctl.d/90-SheepShaver.conf
}

# vim: ts=2:sw=2:et:

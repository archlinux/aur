# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2
pkgver=0.2.0
_rpcver=3.3.0
_jsonver=20f8604ee6cd078c1cb2346148c69c0c2c160db2
pkgrel=2
pkgdesc='Open source re-implementation of Roller Coaster Tycoon 2 (requires full
         copy of the game)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://openrct2.io'
license=('GPL3')
depends=('hicolor-icon-theme' 'sdl2' 'curl' 'jansson' 'speexdsp' 'fontconfig'
         'libpng' 'openssl' 'libzip' 'icu')
makedepends=('cmake')
optdepends=('zenity: System dialog box support (GNOME/GTK)'
            'kdialog: System dialog box support (KDE)'
            'alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
install=openrct2.install
source=("https://github.com/OpenRCT2/OpenRCT2/archive/v$pkgver.tar.gz"
        "https://github.com/discordapp/discord-rpc/archive/v$_rpcver.tar.gz"
        "https://github.com/janisozaur/rapidjson/archive/$_jsonver.tar.gz")
sha256sums=('bff3fcc728765b51d2498e685e2a7f28e2c1a830691fd2c3ea5dd82354962bfb'
            '1c625f3546761e778e084fe037540f4fdb5452e9c297ee790bbb43ce3cf955b5'
            'a116ec9a36141d6b4c66d60e0751a0a9f4d3ad198d0b539bd2a6af629b71d3e7')

prepare() {
  cd "$srcdir/OpenRCT2-$pkgver"
  ln -sf "$srcdir/discord-rpc-$_rpcver" discord-rpc
  mkdir -p discord-rpc/thirdparty
  ln -sf "$srcdir/rapidjson-$_jsonver" discord-rpc/thirdparty/rapidjson
}

build() {
  cd "$srcdir/OpenRCT2-$pkgver"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib ..
  make all g2
}

package() {
  cd "$srcdir/OpenRCT2-$pkgver/build"

  make DESTDIR="$pkgdir" install

  rm "$pkgdir/usr/lib/libopenrct2.a"
  rm "$pkgdir/usr/lib/libdiscord-rpc.a"
  rmdir "$pkgdir/usr/lib"

  rm "$pkgdir/usr/include/discord_rpc.h"
  rm "$pkgdir/usr/include/discord_register.h"
  rmdir "$pkgdir/usr/include"
}

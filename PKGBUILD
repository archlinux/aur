# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2
pkgver=0.2.1
_rpcver=3.3.0
_jsonver=73063f5002612c6bf64fe24f851cd5cc0d83eef9
pkgrel=1
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
        "https://github.com/Tencent/rapidjson/archive/$_jsonver.tar.gz")
sha256sums=('0ed5b37997396d295f71f60e720d92f9a7713ecb4e96bdcff417de7e0698bfbb'
            '1c625f3546761e778e084fe037540f4fdb5452e9c297ee790bbb43ce3cf955b5'
            '896eb817fb2bc62a0a84ca65fac3e3c385b410e6dbf70d69c411e25776663e39')

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

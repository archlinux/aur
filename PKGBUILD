# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2
pkgver=0.2.2
_rpcver=3.4.0
_jsonver=73063f5002612c6bf64fe24f851cd5cc0d83eef9
pkgrel=1
pkgdesc='Open source re-implementation of Roller Coaster Tycoon 2 (requires full
         copy of the game)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://openrct2.io'
license=('GPL3')
depends=('hicolor-icon-theme' 'sdl2' 'curl' 'jansson' 'speexdsp' 'fontconfig'
         'libpng' 'openssl' 'libzip' 'icu')
makedepends=('cmake' 'rapidjson')
optdepends=('zenity: System dialog box support (GNOME/GTK)'
            'kdialog: System dialog box support (KDE)'
            'alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
install=openrct2.install
source=("https://github.com/OpenRCT2/OpenRCT2/archive/v$pkgver.tar.gz"
        "https://github.com/discordapp/discord-rpc/archive/v$_rpcver.tar.gz")
sha256sums=('4b7b003fc0cf365be8a43d8784827415dbba3335de59cb948ab720ec1ebcaa7b'
            'e13427019027acd187352dacba6c65953af66fdf3c35fcf38fc40b454a9d7855')

prepare() {
  cd "$srcdir/OpenRCT2-$pkgver"
  ln -sf "$srcdir/discord-rpc-$_rpcver" discord-rpc
  mkdir -p discord-rpc/thirdparty
  ln -sf "/usr/include/rapidjson" discord-rpc/thirdparty/rapidjson
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

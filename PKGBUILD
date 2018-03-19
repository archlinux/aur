# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2
pkgver=0.1.2
_rpcver=3.0.0
pkgrel=1
pkgdesc='Open source re-implementation of Roller Coaster Tycoon 2 (requires full
         copy of the game)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://openrct2.website'
license=('GPL3')
depends=('hicolor-icon-theme' 'sdl2' 'curl' 'jansson' 'speexdsp' 'fontconfig'
         'libpng' 'openssl' 'libzip')
makedepends=('cmake')
optdepends=('zenity: System dialog box support (GNOME/GTK)'
            'kdialog: System dialog box support (KDE)'
            'alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
install=openrct2.install
source=("https://github.com/OpenRCT2/OpenRCT2/archive/v$pkgver.tar.gz"
        "https://github.com/discordapp/discord-rpc/archive/v$_rpcver.tar.gz")
sha256sums=('358fc0ceff848734b399dc63c1d7a0c096a54a793afe4522d6f0dd00ba9328c7'
            '1ae4d7614ee8de540c3c565336f53945088c6577a44e3193e70f41c4e68bc925')

prepare() {
  cd "$srcdir/OpenRCT2-$pkgver"
  ln -sf "$srcdir/discord-rpc-$_rpcver" discord-rpc
}

build() {
  cd "$srcdir/OpenRCT2-$pkgver"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib -DWITH_TESTS=on -DDISABLE_RCT2_TESTS=on ..
  make all g2
}

check() {
  cd "$srcdir/OpenRCT2-$pkgver/build"

  make test
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

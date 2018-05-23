# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2-git
pkgver=r14178.bdc75a4d3
pkgrel=1
pkgdesc='Open source re-implementation of Roller Coaster Tycoon 2 (requires full
         copy of the game)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://openrct2.io'
license=('GPL3')
depends=('hicolor-icon-theme' 'sdl2' 'curl' 'jansson' 'speexdsp' 'fontconfig'
         'libpng' 'openssl' 'libzip')
makedepends=('git' 'cmake')
optdepends=('zenity: System dialog box support (GNOME/GTK)'
            'kdialog: System dialog box support (KDE)'
            'alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
conflicts=('openrct2')
provides=('openrct2')
install=openrct2.install
source=("$pkgname"::'git+https://github.com/OpenRCT2/OpenRCT2.git#branch=develop'
        'discord-rpc::git+https://github.com/discordapp/discord-rpc.git'
        'rapidjson::git+https://github.com/janisozaur/rapidjson.git#branch=patch-1')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  ln -sf "$srcdir/discord-rpc" discord-rpc
  mkdir -p discord-rpc/thirdparty
  ln -sf "$srcdir/rapidjson" discord-rpc/thirdparty/rapidjson
}

build() {
  cd "$srcdir/$pkgname"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib -DWITH_TESTS=on -DDISABLE_RCT2_TESTS=on ..
  make all g2
}

check() {
  cd "$srcdir/$pkgname/build"

  make test
}

package() {
  cd "$srcdir/$pkgname/build"

  make DESTDIR="$pkgdir" install

  rm "$pkgdir/usr/lib/libopenrct2.a"
  rm "$pkgdir/usr/lib/libdiscord-rpc.a"
  rmdir "$pkgdir/usr/lib"

  rm "$pkgdir/usr/include/discord_rpc.h"
  rm "$pkgdir/usr/include/discord_register.h"
  rmdir "$pkgdir/usr/include"
}

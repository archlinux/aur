# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2-git
pkgver=r21143.594b08c91
pkgrel=1
pkgdesc='Open source re-implementation of Roller Coaster Tycoon 2 (requires full
         copy of the game)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://openrct2.io'
license=('GPL3')
depends=('hicolor-icon-theme' 'sdl2' 'curl' 'nlohmann-json' 'speexdsp'
         'fontconfig' 'libpng' 'openssl' 'libzip' 'icu' 'duktape' 'benchmark')
makedepends=('git' 'cmake' 'discord-rpc-api')
optdepends=('zenity: System dialog box support (GNOME/GTK)'
            'kdialog: System dialog box support (KDE)'
            'alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
conflicts=('openrct2')
provides=('openrct2')
install=openrct2.install
source=("$pkgname"::'git+https://github.com/OpenRCT2/OpenRCT2.git#branch=develop')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib ..
  make all g2
}

package() {
  cd "$srcdir/$pkgname/build"

  make DESTDIR="$pkgdir" install

  rm "$pkgdir/usr/lib/libopenrct2.a"
  rmdir "$pkgdir/usr/lib"
}

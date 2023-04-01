# Maintainer: Ryan Dupke <rctdude2 at gmail dot com>
# Contributor: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2-git
pkgver=0.4.4.r18.g1174063c27
pkgrel=1
pkgdesc='Open source re-implementation of Roller Coaster Tycoon 2 (requires full
         copy of the game)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://openrct2.io'
license=('GPL3')
depends=('hicolor-icon-theme' 'sdl2' 'curl' 'speexdsp'
         'fontconfig' 'libpng' 'openssl' 'libzip' 'icu' 'benchmark'
         'libogg' 'libvorbis' 'flac' 'discord-rpc')
makedepends=('git' 'cmake' 'ninja' 'nlohmann-json')
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
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # Required options to workaround GCC 12 issues
  # https://github.com/OpenRCT2/OpenRCT2/issues/17371
  CXXFLAGS+=" -Wno-error=maybe-uninitialized  -Wno-error=restrict  -Wno-error=null-dereference"

  # Needed to be able to build while LTO is enabled
  # https://github.com/OpenRCT2/OpenRCT2/issues/6200
  CXXFLAGS+="  -Wno-error=stringop-overflow"

  cmake -G Ninja -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DSTATIC=OFF \
        -Wno-dev
  ninja
}

package() {
  DESTDIR="$pkgdir" ninja install

  rm "$pkgdir/usr/lib/libopenrct2.a"
  rmdir "$pkgdir/usr/lib"
}

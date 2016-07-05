# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2-git
pkgver=r7941.42029c0
pkgrel=1
pkgdesc='Open source re-implementation of Roller Coaster Tycoon 2 (requires full
         copy of the game)'
arch=('i686' 'x86_64')
url='https://openrct2.website'
license=('GPL3')
depends=('hicolor-icon-theme')
depends_i686=('sdl2' 'sdl2_ttf' 'curl' 'jansson' 'speexdsp' 'fontconfig'
              'libpng' 'openssl')
depends_x86_64=('lib32-sdl2' 'lib32-sdl2_ttf' 'lib32-curl' 'lib32-jansson'
                'lib32-speexdsp' 'lib32-fontconfig' 'lib32-libpng'
                'lib32-openssl')
makedepends=('git' 'cmake')
makedepends_x86_64=('gcc-multilib')
optdepends_i686=('lib32-alsa-lib: ALSA audio driver'
                 'lib32-libpulse: PulseAudio audio driver')
optdepends_x86_64=('alsa-lib: ALSA audio driver'
                   'libpulse: PulseAudio audio driver')
conflicts=('openrct2')
provides=('openrct2')
options=('!buildflags')
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
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr ..
  make all g2
}

package() {
  cd "$srcdir/$pkgname"

  # Standard OpenRCT2 distribution files.
  pushd build
  make DESTDIR="$pkgdir" install
  popd

  # ArchLinux-specific stuff (.desktop file and icon).
  install -Dm644 distribution/linux/openrct2.desktop "$pkgdir/usr/share/applications/openrct2.desktop"
  install -Dm644 resources/logo/icon_flag.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/openrct2.svg"
}

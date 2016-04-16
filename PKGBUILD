# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2
pkgver=0.0.4
pkgrel=1
pkgdesc='Open source re-implementation of Roller Coaster Tycoon 2 (requires full
         copy of the game)'
arch=('i686' 'x86_64')
url='https://github.com/OpenRCT2/OpenRCT2'
license=('GPL3')
depends=('gtk-update-icon-cache' 'desktop-file-utils')
depends_i686=('sdl2' 'sdl2_ttf' 'curl' 'jansson' 'speexdsp' 'fontconfig'
              'libpng')
depends_x86_64=('lib32-sdl2' 'lib32-sdl2_ttf' 'lib32-curl' 'lib32-jansson'
                'lib32-speexdsp' 'lib32-fontconfig' 'lib32-libpng')
makedepends=('git' 'cmake')
makedepends_x86_64=('gcc-multilib')
options=('!buildflags')
install=openrct2.install
source=("https://github.com/OpenRCT2/OpenRCT2/archive/v$pkgver.tar.gz"
        'openrct2.desktop')
sha256sums=('ebcbbf1de3ccb76168535308ec9045271fae6c730bca4929575277f98deb40ab'
            'b916d4a9f56af82693ba21f43e09ababe9f132fd7c3b78efa1b4387ee1bc3a4d')

build() {
  cd "$srcdir/OpenRCT2-$pkgver"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr ..
  make all g2
}

package() {
  cd "$srcdir/OpenRCT2-$pkgver"

  # Standard OpenRCT2 distribution files.
  pushd build
  make DESTDIR="$pkgdir" install
  popd

  # ArchLinux-specific stuff (.desktop file and icon).
  install -Dm644 "$srcdir/openrct2.desktop" "$pkgdir/usr/share/applications/openrct2.desktop"
  install -Dm644 resources/logo/icon_flag.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/openrct2.svg"
}

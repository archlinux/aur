# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2-git
pkgver=r5504.8d3da0d
pkgrel=1
pkgdesc='Open source clone of RollerCoaster Tycoon 2'
arch=('i686' 'x86_64')
url='https://github.com/OpenRCT2/OpenRCT2'
license=('GPL3')
depends=('gtk-update-icon-cache' 'desktop-file-utils')
makedepends=('git' 'cmake')
conflicts=('openrct2')
provides=('openrct2')
options=('!buildflags')
install=openrct2.install
source=("$pkgname"::'git+https://github.com/OpenRCT2/OpenRCT2.git#branch=develop'
        'https://openrct.net/launcher/libs/orctlibs.zip'
        'openrct2.desktop')
sha256sums=('SKIP'
            '0a7b5ea46e9cb4b19000b69690eae0b75929752f7db192c78bd7ffb61d696835'
            'b916d4a9f56af82693ba21f43e09ababe9f132fd7c3b78efa1b4387ee1bc3a4d')

if [ "$CARCH" = "i686" ]; then
  depends+=('sdl2' 'sdl2_ttf' 'curl' 'jansson' 'speexdsp' 'fontconfig' 'libpng')
else
  depends+=('lib32-sdl2' 'lib32-sdl2_ttf' 'lib32-curl' 'lib32-jansson'
            'lib32-speexdsp' 'lib32-fontconfig' 'lib32-libpng')
  makedepends+=('gcc-multilib')
fi

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"

  # Copy local libraries into lib.
  if [ ! -d lib ]; then
    cp -r "$srcdir/local" lib
  fi
}

build() {
  cd "$srcdir/$pkgname"

  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Debug ..
  make all g2
}

package() {
  cd "$srcdir/$pkgname"

  # Standard OpenRCT2 distribution files.
  install -Dm755 build/openrct2 "$pkgdir/usr/bin/openrct2"

  install -Dm644 build/g2.dat "$pkgdir/usr/share/openrct2/g2.dat"

  install -dm755 "$pkgdir/usr/share/openrct2/language"
  install -m644 data/language/* "$pkgdir/usr/share/openrct2/language/"

  install -dm755 "$pkgdir/usr/share/openrct2/title/openrct2"
  install -m644 data/title/openrct2/* "$pkgdir/usr/share/openrct2/title/openrct2"

  install -dm755 "$pkgdir/usr/share/openrct2/title/rct2"
  install -m644 data/title/rct2/* "$pkgdir/usr/share/openrct2/title/rct2"

  # ArchLinux-specific stuff (.desktop file and icon).
  install -Dm644 "$srcdir/openrct2.desktop" "$pkgdir/usr/share/applications/openrct2.desktop"
  install -Dm644 resources/logo/icon_flag.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/openrct2.svg"
}

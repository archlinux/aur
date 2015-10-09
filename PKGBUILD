# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=openrct2-git
pkgver=r4637.21c8437
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
        'openrct2'
        'openrct2.desktop')
sha256sums=('SKIP'
            '0a7b5ea46e9cb4b19000b69690eae0b75929752f7db192c78bd7ffb61d696835'
            '2cead106464f257d64c74333280ee6bf4056167cc69840371e81a77e64858989'
            'b916d4a9f56af82693ba21f43e09ababe9f132fd7c3b78efa1b4387ee1bc3a4d')

if [ "$CARCH" = "i686" ]; then
  depends+=('sdl2' 'sdl2_ttf' 'curl' 'jansson' 'speexdsp')
else
  depends+=('lib32-sdl2' 'lib32-sdl2_ttf' 'lib32-curl' 'lib32-jansson'
            'lib32-speexdsp')
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

  # The ArchLinux jansson header files are directly under
  # /usr/include.
  find src \( -name '*.c' -or -name '*.h' -or -name '*.cpp' \) \
    -exec sed -i 's@#include <jansson/@#include <@' {} \;
}

build() {
  cd "$srcdir/$pkgname"

  cmake -DCMAKE_BUILD_TYPE=Debug .
  make

  # openrct2 sprite build segfaults even if it finishes successfully, so we
  # ignore its return code.
  ./openrct2 sprite build data/g2.dat resources/g2 || true
}

package() {
  cd "$srcdir/$pkgname"

  # Standard OpenRCT2 distribution files.
  install -Dm755 openrct2 "$pkgdir/usr/share/openrct2/openrct2"
  install -Dm644 openrct2.exe "$pkgdir/usr/share/openrct2/openrct2.exe"

  install -Dm644 data/g2.dat "$pkgdir/usr/share/openrct2/data/g2.dat"

  install -dm755 "$pkgdir/usr/share/openrct2/data/language"
  install -m644 data/language/* "$pkgdir/usr/share/openrct2/data/language/"

  install -dm755 "$pkgdir/usr/share/openrct2/data/title/openrct2"
  install -m644 data/title/openrct2/* "$pkgdir/usr/share/openrct2/data/title/openrct2"

  install -dm755 "$pkgdir/usr/share/openrct2/data/title/rct2"
  install -m644 data/title/rct2/* "$pkgdir/usr/share/openrct2/data/title/rct2"

  # Use root certificates from ArchLinux instead of the ones bundled with
  # OpenRCT2.
  ln -sf /etc/ssl/certs/ca-certificates.crt "$pkgdir/usr/share/openrct2/curl-ca-bundle.crt"

  # ArchLinux-specific stuff (launcher, .desktop file and icon).
  install -Dm755 "$srcdir/openrct2" "$pkgdir/usr/bin/openrct2"
  install -Dm644 "$srcdir/openrct2.desktop" "$pkgdir/usr/share/applications/openrct2.desktop"
  install -Dm644 resources/logo/icon_flag.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/openrct2.svg"
}

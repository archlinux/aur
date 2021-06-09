pkgname=fheroes2
pkgver=0.9.4
pkgrel=2
pkgdesc="Free remake of Heroes of Might and Magic II game engine"
arch=('i686' 'x86_64' 'armv7h')
url="https://ihhub.github.io/fheroes2/"
license=('GPL2')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer' 'sdl2_net' 'sdl2_ttf' 'tinyxml')
optdepends=('curl: download demo version files'
            'wget: download demo version files'
            'unzip: unpack demo version files')
makedepends=('gettext' 'icoutils')
conflicts=('fheroes2-git' 'fheroes2-svn')
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/ihhub/$pkgname/archive/$pkgver.tar.gz
  fheroes2.desktop
)
md5sums=(
  'c3cb8ab7e5c2e33fd7d1a5451ff00910'
  '99e02779f24c11aa2f37837c14d7d4aa'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver/src/resources"
  icotool -x fheroes2.ico
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CFLAGS+=' -DCONFIGURE_FHEROES2_DATA=\"/usr/share/fheroes2\"'
  export CXXFLAGS+=' -DCONFIGURE_FHEROES2_DATA=\"/usr/share/fheroes2\"'
  make RELEASE=1 WITHOUT_BUNDLED_LIBS=1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 "$srcdir/fheroes2.desktop" "$pkgdir/usr/share/applications/fheroes2.desktop"

  install -Dm755 "src/dist/fheroes2" "$pkgdir/usr/bin/fheroes2"
  install -Dm755 "script/demo/demo_unix.sh" "$pkgdir/usr/share/fheroes2/demo_unix.sh"
  install -Dm644 "fheroes2.key" "$pkgdir/usr/share/fheroes2/fheroes2.key"
  install -dm755 "$pkgdir/usr/share/fheroes2/data"
  install -dm755 "$pkgdir/usr/share/fheroes2/maps"

  # Install icons
  for size in 16 32 48 256; do
    install -Dm644 src/resources/fheroes2_*_${size}x${size}x32.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/fheroes2.png"
  done
  install -Dm644 "files/images/platform/psv/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/fheroes2.png"
}

# vim:set ts=2 sw=2 et:

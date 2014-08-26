# Maintainer: Ian D. Scott <ian@perebruin.com>
# Contributer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton AT gmail DOT com>
# Contributor: spider-mario <spidermario@free.fr>

pkgname=ariamaestosa
pkgver=1.4.10
pkgrel=1
pkgdesc='MIDI editor, player, tracker and composer'
arch=('x86_64' 'i686')
url='http://ariamaestosa.sourceforge.net/'
license=('GPL2')
depends=('wxgtk' 'mesa' 'alsa-lib' 'hicolor-icon-theme' 'xdg-utils'
         'desktop-file-utils' 'webkitgtk2')
optdepends=('timidity++: for midi playback'
            'timidity-freepats: for midi playback')
makedepends=('scons' 'setconf')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/$pkgname/AriaSrc-$pkgver.tar.bz2")
sha256sums=('348484d5012d613a63fc2bcf256e0b47155696aceac8596d6401d5a9cc0f52f6')

prepare() {
  cd "AriaSrc-$pkgver"

  mv Resources/Documentation Documentation
  mv Resources/score score2

  setconf Freedesktop/Aria.desktop Exec "$pkgname"
  sed -i -e "/^Version/s:1.2.2:1.2.3:" -e "/^Icon/s:/local::" \
    Freedesktop/Aria.desktop
  setconf Freedesktop/Aria.desktop Icon "$pkgname"
}

build() {
  cd "AriaSrc-$pkgver"

  scons \
    config=release \
    prefix="$pkgdir/usr" \
    WXCONFIG='/usr/bin/wx-config'
}

package() {
  cd "AriaSrc-$pkgver"

  scons \
    config=release \
    prefix="$pkgdir/usr" \
    WXCONFIG='/usr/bin/wx-config' \
    install

  cp -r score2 "$pkgdir/usr/share/Aria/score"

  # Packaging documentation
  mkdir -p "$pkgdir/usr/share/doc"
  cp -r Documentation "$pkgdir/usr/share/doc/$pkgname"
  #cp -r score "$pkgdir/usr/share/Aria"

  # Packaging desktop shortcut and icon
  install -Dm644 Freedesktop/Aria.desktop \
    "$pkgdir/usr/share/applications/Aria.desktop"
  install -m644 Freedesktop/*.png Freedesktop/*.xml "$pkgdir/usr/share/Aria/"
  install -Dm644 aria32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 aria48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 aria48.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 aria64.png \
    "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 aria128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"

  # Packaging license
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

  # Cleaning up
  mv "$pkgdir/usr/bin/Aria" "$pkgdir/usr/bin/$pkgname"
  mv "$pkgdir/usr/share/Aria" "$pkgdir/usr/share/$pkgname"
  mv "$pkgdir/usr/share/applications/Aria.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:

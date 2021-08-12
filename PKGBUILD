# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Ian D. Scott <ian@perebruin.com>
# Contributer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Hilton Medeiros <medeiros.hilton AT gmail DOT com>
# Contributor: spider-mario <spidermario@free.fr>

pkgname=ariamaestosa
pkgver=1.4.13
pkgrel=3
pkgdesc='MIDI editor, player, tracker and composer'
arch=('x86_64' 'i686')
url='http://ariamaestosa.sourceforge.net/'
license=('GPL2')
depends=('wxgtk2' 'mesa' 'alsa-lib' 'hicolor-icon-theme' 'xdg-utils'
         'desktop-file-utils' 'webkitgtk')
optdepends=('timidity++: for midi playback'
            'timidity-freepats: for midi playback'
            'fluidsynth: for midi playback')
makedepends=('setconf' 'python2')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/$pkgname/AriaSrc-$pkgver.tar.bz2"
        "$pkgname.patch")
sha256sums=('6d58dd721a5cdd1a17db9004bc835c59b29ec14dbd56556a3e90899e9df943b3'
            '4d43e6793e32386fc063a5660ae55696387e477b3c5011cb8f72f59ce9c3a2f4')

prepare() {
  cd "AriaSrc-$pkgver"

  patch -p1 -i ../$pkgname.patch

  setconf Freedesktop/Aria.desktop Exec "$pkgname"
  sed -i -e "/^Version/s:1.4.1:$pkgver:" -e "/^Icon/s:/local::" \
    Freedesktop/Aria.desktop
  setconf Freedesktop/Aria.desktop Icon "$pkgname"
}

build() {
  cd "AriaSrc-$pkgver"

  python2 scons/scons.py
}

package() {
  cd "AriaSrc-$pkgver"

  python2 scons/scons.py install prefix=$pkgdir/usr

  # Packaging documentation
  mkdir -p "$pkgdir/usr/share/doc"
  cp -r Resources/Documentation "$pkgdir/usr/share/doc/$pkgname"

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

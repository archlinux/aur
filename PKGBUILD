# Maintainer : Rob McCathie <korrode AT gmail>
# Contributor: sumt <sumt at sci dot fi>

pkgname=palemoon-atom-bin
pkgver=26.3.0
pkgrel=1
pkgdesc="Open source web browser based on Firefox focusing on efficiency - i686 Intel Atom optimised version"
arch=('i686')
url="http://linux.palemoon.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'alsa-lib')
optdepends=('palemoon-i18n-default: language pack for system active language'
            'gst-plugins-good: h.264 video, aac and mp3 audio playback'
            'gst-libav: h.264 video, aac and mp3 audio playback'
            'hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification')
provides=("palemoon=$pkgver")
conflicts=('palemoon')
options=('!strip')
source=("http://linux.palemoon.org/files/atom/$pkgver/palemoon-$pkgver-atom.en-US.linux-i686.tar.bz2"
        "palemoon.desktop")
sha1sums=('c739d43746daa4eb72c1e0d39665e1c00e10ba46'
          'e8d4cbcd51326c337a2c901e7aff7b6c54043dec')

package() {
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r palemoon/ "$pkgdir/usr/lib/palemoon"
  ln -s ../lib/palemoon/palemoon "$pkgdir/usr/bin/palemoon"
  install -Dm644 palemoon.desktop "$pkgdir/usr/share/applications/palemoon.desktop"

  # icons
  install -Dm644 palemoon/browser/chrome/icons/default/default16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/palemoon.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/palemoon.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/palemoon.png"
  install -Dm644 palemoon/browser/icons/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/palemoon.png"

  # use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/palemoon/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/palemoon/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/palemoon/hyphenation"

  # avoid duplicate binaries
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf palemoon "$pkgdir/usr/lib/palemoon/palemoon-bin"
}

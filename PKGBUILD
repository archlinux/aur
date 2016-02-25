# Maintainer: sumt <sumt at sci dot fi>
pkgname=palemoon-bin
pkgver=26.1.1
pkgrel=1
pkgdesc="Open source web browser based on Firefox focusing on efficiency."
arch=('i686' 'x86_64')
url="http://linux.palemoon.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'dbus-glib' 'desktop-file-utils' 'libxt' 'mime-types' 'nss' 'alsa-lib')
optdepends=('palemoon-i18n-default: language pack for system active language'
            'gstreamer0.10-base-plugins: vorbis decoding, ogg demuxing'
            'gstreamer0.10-good-plugins: webm and mp4 demuxing'
            'gstreamer0.10-bad-plugins: aac, vp8 and opus decoding'
            'gstreamer0.10-ugly-plugins: h.264 and mp3 decoding'
            'gstreamer0.10-ffmpeg: h.264 decoding'
            'hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification')
provides=("palemoon=$pkgver")
conflicts=('palemoon')
install=palemoon.install
source=(palemoon.desktop)
source_i686=(http://linux.palemoon.org/files/$pkgver/palemoon-$pkgver.en-US.linux-i686.tar.bz2)
source_x86_64=(http://linux.palemoon.org/files/$pkgver/palemoon-$pkgver.en-US.linux-x86_64.tar.bz2)
md5sums=('62be30c3b4f4088c7f68d47df9121618')
md5sums_i686=('bb4a3690fac192753d7777726d7dc5e2')
md5sums_x86_64=('f7bf06061cd77dda706729bcb9cb5826')

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

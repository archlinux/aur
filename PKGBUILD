# Maintainer: Det <nimetonmaili g-mail>
# Contributors: Achilleas Pipinellis, speed145a, Schnouki

pkgname=firefox-beta-bin
pkgver=40.0b4
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org - Beta"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/en-US/firefox/channel/#beta"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'hicolor-icon-theme'
         'icu' 'libevent' 'libvpx' 'libxt' 'mime-types' 'nss' 'sqlite')
optdepends=('gstreamer0.10-base: vorbis decoding, ogg demuxing'
            'gstreamer0.10-good: webm and mp4 demuxing'
            'gstreamer0.10-bad: aac, vp8 and opus decoding'
            'gstreamer0.10-ugly: h.264 and mp3 decoding'
            'gstreamer0.10-ffmpeg: more decoders'
            'libpulse: PulseAudio driver'
            'networkmanager: Location detection via available WiFi networks')
makedepends=('pacman>=4.2.0')
install=$pkgname.install
source=("$pkgname.desktop"
        "$pkgname-safe.desktop")
source_i686=("https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver/linux-i686/en-US/firefox-$pkgver.tar.bz2")
source_x86_64=("https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$pkgver/linux-x86_64/en-US/firefox-$pkgver.tar.bz2")
# RC
if [[ $_build = ? ]]; then
  source_i686=("https://ftp.mozilla.org/pub/mozilla.org/firefox/candidates/$_major-candidates/build$_build/linux-i686/en-US/firefox-$_major.tar.bz2")
  source_x86_64=("https://ftp.mozilla.org/pub/mozilla.org/firefox/candidates/$_major-candidates/build$_build/linux-x86_64/en-US/firefox-$_major.tar.bz2")
fi
md5sums=('13bd50c37f55a83539a680ce83162468'
         'a85c53ccb2b78514f37833d288a20ba2')
md5sums_i686=('8f9eb6e9306778d64817e3e3187666c0')
md5sums_x86_64=('eee58dc4c1f22a21502a2b6540bfd0a9')

package() {
  # Create directories
  msg2 "Creating directory structure..."
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/128x128/apps
  mkdir -p "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r firefox/ "$pkgdir"/opt/$pkgname-$pkgver

  # /usr/bin link
  ln -s /opt/$pkgname-$pkgver/firefox "$pkgdir"/usr/bin/$pkgname

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 22x22 24x24 32x32 48x48 256x256; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$pkgname-$pkgver/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$pkgname.png
  done

  ln -s /opt/$pkgname-$pkgver/browser/icons/mozicon128.png \
        "$pkgdir"/usr/share/icons/hicolor/128x128/apps/$pkgname.png
}

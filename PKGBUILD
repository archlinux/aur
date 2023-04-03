# Maintainer: tarball <bootctl@gmail.com>

pkgname=mullvad-browser-bin
_pkgbase="${pkgname%-bin}"
pkgver=12.0.4
pkgrel=2
pkgdesc='Privacy-focused web browser developed in a collaboration between Mullvad VPN and the Tor Project.'
arch=(x86_64)
url=https://mullvad.net/en/browser
license=(GPL LGPL MPL)
depends=(dbus-glib ffmpeg gtk3 libpulse libxt mime-types nss ttf-font)
optdepends=(
  'hunspell-en_US: Spell checking, American English'
  'libnotify: Notification integration'
  'networkmanager: Location detection via available WiFi networks'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'xdg-desktop-portal: Screensharing with Wayland')
provides=("$_pkgbase=$pkgver" 'mullvad-browser')
conflicts=("$_pkgbase")
options=(!strip)

source=(mullvad-browser.desktop)
source_x86_64=(${pkgname}-${pkgver}-x86_64.tar.xz::https://cdn.mullvad.net/browser/$pkgver/mullvad-browser-linux64-${pkgver}_ALL.tar.xz)

sha256sums=('82de45a644102a8e4c63b74e8b6d99ec553d9ceb526ef1514fe65b6bc72d61f1')
sha256sums_x86_64=('ab875328d42472a691c22176e6254e412bf054b037b494654380f30b7b6e1b90')

package() {
  install -dm0755 "$pkgdir/opt"
  cp -a mullvad-browser "$pkgdir/opt/$pkgname"

  # by default, only owner has access to all files
  chmod -R ugo+r "$pkgdir/opt/$pkgname"
  find "$pkgdir/opt/$pkgname" -executable -execdir chmod ugo+x '{}' +

  # ask it to create profiles in ~
  touch "$pkgdir/opt/$pkgname/Browser/system-install"

  install -Dm0644 -t "$pkgdir/usr/share/applications/" mullvad-browser.desktop

  for size in 16x16 32x32 48x48 64x64 128x128; do
    install -Dm0644 "$pkgdir/opt/$pkgname/Browser/browser/chrome/icons/default/default${size/x*/}.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/mullvad-desktop.png"
  done
}

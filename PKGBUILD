# Maintainer: tarball <bootctl@gmail.com>

pkgname=mullvad-browser-bin
_pkgbase="${pkgname%-bin}"
pkgver=12.0.4
pkgrel=3
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

source=($_pkgbase.sh mullvad-browser.desktop)
source_x86_64=(${pkgname}-${pkgver}-x86_64.tar.xz::https://cdn.mullvad.net/browser/$pkgver/mullvad-browser-linux64-${pkgver}_ALL.tar.xz)

sha256sums=('7be1e26a22d71c795a53a93492358861169bac32cd9a4499aed00dff75007110'
            '7d6036df369a79bd54625f621479eff5c02a93ad749da3315f0e5ce14ba1f241')
sha256sums_x86_64=('ab875328d42472a691c22176e6254e412bf054b037b494654380f30b7b6e1b90')

package() {
  install -dm0755 "$pkgdir/opt"
  cp -a mullvad-browser "$pkgdir/opt/$pkgname"

  # by default, only owner has access to all files
  chmod -R ugo+r "$pkgdir/opt/$pkgname"
  find "$pkgdir/opt/$pkgname" -executable -execdir chmod ugo+x '{}' +

  # ask it to create profiles in ~
  touch "$pkgdir/opt/$pkgname/Browser/system-install"

  # cli wrapper
  install -Dm0755 $_pkgbase.sh "$pkgdir/usr/bin/$_pkgbase"

  # desktop file for various launchers
  install -Dm0644 -t "$pkgdir/usr/share/applications/" $_pkgbase.desktop

  # icons
  for size in 16x16 32x32 48x48 64x64 128x128; do
    install -Dm0644 "$pkgdir/opt/$pkgname/Browser/browser/chrome/icons/default/default${size/x*/}.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/mullvad-browser.png"
  done
}

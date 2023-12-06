# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>
#
# Fetching the signing key:
# https://mullvad.net/en/help/verifying-mullvad-browser-signature

pkgname=mullvad-browser-bin
pkgver=13.0.6
pkgrel=1
pkgdesc='Privacy-focused web browser developed by Mullvad VPN and the Tor Project'
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
provides=(mullvad-browser=$pkgver mullvad-browser)
conflicts=(mullvad-browser)

source=(
  https://cdn.mullvad.net/browser/$pkgver/mullvad-browser-linux-x86_64-$pkgver.tar.xz{,.asc}
  mullvad-browser.sh
  mullvad-browser.desktop
)
validpgpkeys=(
  'EF6E286DDA85EA2A4BA7DE684E2C6E8793298290' # Tor Browser Developers (signing key) <torbrowser@torproject.org>
)
changelog='mullvad-browser.changelog'

sha256sums=('f822cc017772aa9d072deebc973a7ba79e27d8719940fc1919c9305713a0e0fc'
            'SKIP'
            '0fbfcc63591c661fd73de462a123e6daeae01d7ebc5981c8793227369d77b565'
            '9bb24b8e210112b1222d028285c6d68ab599f8382b2b108ab69284948bb4ac70')

package() {
  cd mullvad-browser

  # only owner has access to all files
  chmod --recursive a+r .
  find . -executable -execdir chmod a+x '{}' +

  # copy files from archive
  install -dm0755 "$pkgdir/opt/mullvad-browser/"
  cp --archive Browser/* "$pkgdir/opt/mullvad-browser/"

  # ask it to create profiles in ~
  touch "$pkgdir/opt/mullvad-browser/system-install"

  # cli wrapper
  install -Dm0755 "$srcdir/mullvad-browser.sh" "$pkgdir/usr/bin/mullvad-browser"

  # desktop file for various launchers
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/mullvad-browser.desktop"

  # icons
  for size in 16 32 48 64 128; do
    install -Dm0644 "$pkgdir/opt/mullvad-browser/browser/chrome/icons/default/default$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/mullvad-browser.png"
  done
}

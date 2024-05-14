# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Mark Wagie <mark.wagie@proton.me>
#
# Fetching the signing key:
# https://mullvad.net/en/help/verifying-mullvad-browser-signature

pkgname=mullvad-browser-bin
pkgver=13.0.15
pkgrel=1
pkgdesc='Privacy-focused web browser developed by Mullvad VPN and the Tor Project'
arch=(x86_64)
url=https://mullvad.net/en/browser
license=(GPL-3.0-or-later MPL-2.0)
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

# This package used cdn.mullvad.net for the first 10 months or so and was then
# switched to GitHub because the former is very slow or completely inaccessible
# in some parts of the world:
#   1. areas geographically furthest from Europe
#   2. countries that block access to VPN providers
# If you don't want to download from Microsoft, please replace the line below
# with a sibling commented out line and rebuild.
source=(
  https://github.com/mullvad/mullvad-browser/releases/download/$pkgver/mullvad-browser-linux-x86_64-$pkgver.tar.xz{,.asc}
  #https://cdn.mullvad.net/browser/$pkgver/mullvad-browser-linux-x86_64-$pkgver.tar.xz{,.asc}
  mullvad-browser.sh
  mullvad-browser.desktop
)
validpgpkeys=(
  'EF6E286DDA85EA2A4BA7DE684E2C6E8793298290' # Tor Browser Developers (signing key) <torbrowser@torproject.org>
)
changelog='mullvad-browser.changelog'

sha256sums=('4f2a4f7af024a751bb18fcc14d152fdcde14272740a9f96535e913b187e28ac4'
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

  # license files
  install -dm0755 "$pkgdir/usr/share/licenses/"

  ln -sf /opt/mullvad-browser/MullvadBrowser/Docs/Licenses \
    "$pkgdir/usr/share/licenses/mullvad-browser"

  # TODO: this will be fixed upstream from 13.5 onwards
  cat >"$pkgdir/opt/mullvad-browser/defaults/pref/autoconfig.js" <<EOF
pref("general.config.filename", "aur.cfg");
pref("general.config.obscure_value", 0);
EOF

  cat >"$pkgdir/opt/mullvad-browser/aur.cfg" <<EOF
// Prevent the browser from creating ~/UpdateInfo
lockPref("app.update.auto", false);
EOF
}
